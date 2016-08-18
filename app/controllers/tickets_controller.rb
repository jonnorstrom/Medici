class TicketsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(current_user.id)
    @ticket = Ticket.find(params[:id])
  end

  def create
    @user = User.find(current_user.id)
    @order = current_order
    @ticket = @order.tickets.new(ticket_params)
    @order.save
    session[:order_id] = @order.id

    redirect_to cart_path(id: current_user.id)
  end

  def redeem
    @user = User.find(current_user.id)
    @ticket = Ticket.find(params[:id])
    redirect_to ticket_path(@ticket)
  end

  def update
    @user = User.find(current_user.id)
    @order = current_order
    @ticket = @order.tickets.find(params[:id])
    @ticket.update_attributes(ticket_params)
    @tickets = @order.tickets
    redirect_to cart_path(id: current_user.id)
  end

  def destroy
    @user = User.find(current_user.id)
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
