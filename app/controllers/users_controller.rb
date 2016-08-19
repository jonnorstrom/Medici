class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @tickets = Ticket.where(user_id: current_user.id, paid: true, redeemed: false)
    @redeemed_tickets = Ticket.where(user_id: current_user.id, paid: true, redeemed: true)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to :root
    else
      @errors = @user.errors.full_messages
      render :"user/edit"
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :avatar)
  end
end
