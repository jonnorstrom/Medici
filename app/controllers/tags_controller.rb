class TagsController < ApplicationController
  before_action :get_categories, only: [:new, :create]

  def new
    @tag = Tag.new
    @type_museum = Tag.where(category: "Type of Museum").order(:name)
    @type_art = Tag.where(category: "Type of Art").order(:name)
    @medium = Tag.where(category: "Medium").order(:name)
    @misc = Tag.where(category: "Misc").order(:name)
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

  def destroy_multiple
    if params[:tags]
      params[:tags].each do |tag_id|
        Tag.find(tag_id).destroy
        FavorableTag.where(tag_id: tag_id).destroy_all
      end
    end
    redirect_to(:back)
  end


  private

  def tag_params
    params.require(:tag).permit(:name, :category)
  end

  def get_categories
    @categories = Tag.get_all_categories
  end
end
