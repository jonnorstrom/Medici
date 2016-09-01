class ChargesController < ApplicationController
  before_action :authenticate_user!

  def new
    @order = Order.find(current_order.id)
    @amount = '%.2f' % @order.subtotal
    @display_amount = @order.subtotal * 100.00
  end

  def create
    @order = Order.find(current_order.id)
    @amount_float = @order.subtotal * 100.00
    @amount = @amount_float.to_i
    @final_amount = @amount
    @coupon = Coupon.new(discount_percent: 0.00)
    code = params[:couponCode]

    if !code.blank?
      @coupon = Coupon.get(code)

      if @coupon.nil?
        flash[:error] = 'Coupon code is not valid or expired.'
        redirect_to new_charge_path
        return
      else
        @final_amount = @coupon.apply_discount(@amount.to_i)
        @discount_amount = (@amount - @final_amount)
      end

      charge_metadata = {
        :coupon_code => @coupon.code,
        :coupon_discount => @coupon.discount_percent_human
      }
    end

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )
    stripe_charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @final_amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd',
      :metadata    => charge_metadata
    )
    @charge = Charge.create!(amount: @final_amount, coupon: @coupon, stripe_id: stripe_charge.id)

    @order.tickets.update(paid: true)
    @order.tickets.delete_all
    TicketsMailer.purchase_email(current_user).deliver_later

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
