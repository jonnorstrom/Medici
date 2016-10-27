class ExhibitsController < ApplicationController
  before_action :administrative, only: [:new, :create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :tagging_create

  def show
    @show_page = true
    @exhibit = Exhibit.find(params[:id])
    @related_exhibits = Exhibit.where(museum_id: @exhibit.museum_id)
    @related_exhibits = @related_exhibits.reject{|ex| ex == @exhibit }
    @ticket = current_order.tickets.new
    @museum = Museum.find(@exhibit.museum_id)
    @hash = Gmaps4rails.build_markers(@museum) do |museum, marker|
     marker.lat museum.latitude
     marker.lng museum.longitude
    end
  end

  def new
    @exhibit = Exhibit.new
  end

  def create
    @exhibit = Exhibit.new(exhibit_params)
    if @exhibit.save
      redirect_to :root
    else
      @errors = @exhibit.errors.full_messages
      render :"exhibits/new"
    end
  end

  def search_show
    @all_tags = Tag.all
    @search_show = true
    @all_posts = Museum.all + Exhibit.all + Event.all + Piece.all
    @ticket = current_order.tickets.new
    @posts = []
    @term = params[:search].downcase
    @tags = params[:tag_search]
    if params[:search]
      if @tags
        @all_posts.each do |post|
          if params[:any_or_all] == "Any"
            @tags.each do |param|
              if (post.name.downcase.include?(@term) && post.tags.any? {|attribute| attribute.name == param}) || (post.description.downcase.include?(@term) &&  post.tags.any? {|attribute| attribute.name == param})
                @posts << post
              end
            end
          else
            post_tags = []
            post.tags.each do |tag|
              post_tags << tag.name
            end
            if (post.name.downcase.include?(@term) && (@tags - post_tags).empty?) || (post.description.downcase.include?(@term) && (@tags - post_tags).empty?)
              @posts << post
            end
          end
        end
      else
        @all_posts.each do |post|
          if post.name.downcase.include?(@term) || post.description.downcase.include?(@term)
            @posts << post
          end
        end
      end
    else
      @posts = @all_posts.all.order('created_at DESC')
    end
    Tag.all.each do |tag|
      if tag.name.downcase == @term
        @posts << tag
      end
    end
    @posts = @posts.uniq
    if @posts.length == 1 && @posts[0].is_a?(Tag)
      redirect_to @posts[0]
    end
  end

  def search_new
    @search_show = true
    @show_page = true
    @all_posts = Museum.all + Exhibit.all + Event.all + Piece.all + Tag.all
    @any_or_all = ["any", "all"]
    @tags = Tag.all
  end

  def update
    @exhibit = Exhibit.find(params[:id])
    if @exhibit.update(exhibit_params)
      redirect_to :root
    else
      render :"exhibit/edit"
    end
  end

  def tagging_new
    @search_show = true
    @show_page = true
    @exhibit = Exhibit.find(params[:id])
    @tagging = Tagging.new
  end

  def tagging_create
    @exhibit = Exhibit.find(params[:id])
    @exhibit.taggings.destroy_all
    exhibit_params[:tag_ids].each do |tag|
      if tag != ""
        @tagging = @exhibit.taggings.new(tag_id: tag.to_i)
        @tagging.save
        Rails.logger.info(@tagging.errors.inspect)
      end
    end
    redirect_to exhibit_path(@exhibit)
  end

  def edit
    @exhibit = Exhibit.find(params[:id])
  end

  def destroy
    @exhibit = Exhibit.find(params[:id])
    @exhibit.destroy
    redirect_to :root
  end

  private

  def exhibit_params
    params.require(:exhibit).permit(:name, :blurb, :description, :photo, :price, :start_date, :end_date, :museum_id, :permanent, :ticketsite, :tag_ids => [])
  end
end
