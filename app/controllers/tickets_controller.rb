class TicketsController < ApplicationController
  before_action :authenticate_user!

  def show
    @ticket = Ticket.find(params[:id])
    @tweetable_museum = Museum.find(@ticket.museum_id).name
    @ticket_code = @ticket.redemption_code
  end

  def create
    @order = current_order
    @ticket = @order.tickets.new(ticket_params)
    prng = Random.new
    @ticket.redemption_code = prng.rand(1000000000000).to_s + "MD101"
    @order.save
    @ticket.update(original_quantity: @ticket.quantity)
    session[:order_id] = @order.id
    redirect_to cart_path(id: current_user.id)
  end

  def redeem
    @ticket = Ticket.find(params[:id])
    @quantity = @ticket.quantity
    @ticket.update(quantity: @quantity - 1, order_id: 1)
    if @quantity - 1 == 0
      @ticket.update(redeemed: true)
      redirect_to current_user
    else
      redirect_to ticket_path(@ticket)
    end
  end

  def stats
    @museums = Museum.all
  end

  def update
    @order = current_order
    @ticket = @order.tickets.find(params[:id])
    @ticket.update_attributes(ticket_params)
    @ticket.update(original_quantity: @ticket.quantity)
    @tickets = @order.tickets
    redirect_to cart_path(id: current_user.id)
  end

  def destroy
    @order = current_order
    @ticket = @order.tickets.find(params[:id])
    @ticket.destroy
    @tickets = @order.tickets
    redirect_to cart_path(id: current_user.id)
  end

  private

    def ticket_params
      params.require(:ticket).permit(:user_id, :quantity, :original_quantity, :museum_id)
    end

end
