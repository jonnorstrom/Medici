class TagsController < ApplicationController

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

end
