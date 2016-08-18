class ChargesController < ApplicationController

  def new
    @order = Order.find(current_order.id)
    @amount = '%.2f' % @order.subtotal
    @display_amount = @order.subtotal * 100.00
  end

  def create
    @order = Order.find(current_user.id)
    amount_float = @order.subtotal * 100.00
    @amount = amount_float.to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    @order.tickets.delete_all
    redirect_to :root
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private


end
