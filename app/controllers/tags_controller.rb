class TagsController < ApplicationController
  before_action :get_categories, only: [:new, :create]

  def new
    @tag = Tag.new
  end

  def show
    @tag = Tag.find(params[:id])
    @all_posts = Museum.all + Exhibit.all + Event.all + Piece.all
    @ticket = current_order.tickets.new
    @posts = []
    @all_posts.each do |post|
      if post.tags.include?(@tag)
        @posts << post
      end
    end
    @posts = @posts.uniq
  end


  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to new_tag_path
    else
      @tag_errors = @tag.errors.full_messages
      render :new
    end
  end


  private

  def tag_params
    params.require(:tag).permit(:name, :category)
  end

  def get_categories
    @categories = Tag.get_all_categories
  end
end
