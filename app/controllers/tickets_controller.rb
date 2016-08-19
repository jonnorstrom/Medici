class TicketsController < ApplicationController
  before_action :authenticate_user!

  def show
    @ticket = Ticket.find(params[:id])
  end

  def create
    @order = current_order
    @ticket = @order.tickets.new(ticket_params)
    @order.save
    session[:order_id] = @order.id

    redirect_to cart_path(id: current_user.id)
  end

  def redeem
    @ticket = Ticket.find(params[:id])
    @quantity = @ticket.quantity
    @ticket.update(quantity: @quantity - 1, order_id: 1)
    if @quantity - 1 == 0
      @ticket.update(redeemed: true)
      # @ticket.destroy
      redirect_to current_user
    else
      redirect_to ticket_path(@ticket)
    end
  end

  def update
    @order = current_order
    @ticket = @order.tickets.find(params[:id])
    @ticket.update_attributes(ticket_params)
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
      params.require(:ticket).permit(:user_id, :quantity, :museum_id)
    end

end
