class TicketsController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def create
    @order = current_order
    @ticket = @order.tickets.new(ticket_params)
    @order.save
    session[:order_id] = @order.id

    redirect_to cart_path(id: current_user.id)
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
