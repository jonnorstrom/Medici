class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_filter :verify_authenticity_token, :only => :tagging_create

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

  def tagging_new
    @user = current_user
    @tagging = Tagging.new
  end

  def tagging_create
    user_params[:tag_ids].each do |tag|
      if tag != ""
        @tagging = current_user.taggings.new(tag_id: tag.to_i)
        @tagging.save
        Rails.logger.info(@tagging.errors.inspect)
      end
    end
    redirect_to user_path(current_user)
  end

  def user_params
    params.require(:user).permit(:email, :name, :avatar, :tag_ids => [])
  end
end
