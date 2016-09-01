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
    current_user.taggings.destroy_all
    user_params[:tag_ids].each do |tag|
      if tag != ""
        @tagging = current_user.taggings.new(tag_id: tag.to_i)
        @tagging.save
        Rails.logger.info(@tagging.errors.inspect)
      end
    end
    redirect_to user_path(current_user)
  end

  def personalized
    @all_posts = Museum.all + Exhibit.all + Event.all + Piece.all
    @posts = []
    @ticket = current_order.tickets.new
    @all_posts.each do |post|
      post.taggings.each do |post_tagging|
        current_user.taggings.each do |user_tagging|
          if Tag.find(post_tagging.tag_id) == Tag.find(user_tagging.tag_id)
            @posts << post
          end
        end
      end
    end
    @posts = @posts.uniq
  end

  private
  def user_params
    params.require(:user).permit(:email, :name, :tag_ids => [])
  end
end
