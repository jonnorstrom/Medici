class MuseumsController < ApplicationController
  before_action :administrative, only: [:new, :create, :edit, :update, :destroy]

  skip_before_filter :verify_authenticity_token, :only => :tagging_create

  def index
    @ticket = current_order.tickets.new
    @posts = Museum.all + Exhibit.all..where("end_date > ?", Date.today) + Event.where("end_date > ?", Date.today) + Piece.all
    @main_posts = Event.where(main: true).where("end_date > ?", Date.today)
    if !@main_posts.nil?
      @posts = @posts.to_a - @main_posts
    end
  end

  def show
    @show_page = true
    @museum = Museum.find(params[:id])
    @ticket = current_order.tickets.new
    @exhibits = @museum.exhibits.all + @museum.events.where("end_date > ?", Date.today)
    @hash = Gmaps4rails.build_markers(@museum) do |museum, marker|
      marker.lat museum.latitude
      marker.lng museum.longitude
    end
  end

  def new
    @museum = Museum.new
  end

  def create
    @museum = Museum.new(museum_params)
    if @museum.save
      redirect_to :root
    else
      @errors = @museum.errors.full_messages
      render :"museums/new"
    end
  end

  def update
    @museum = Museum.find(params[:id])
    if @museum.update(museum_params)
      redirect_to :root
    else
      render :"museums/edit"
    end
  end

  def tagging_new
    @type_museum = Tag.where(category: "Type of Museum").order(:name)
    @type_art = Tag.where(category: "Type of Art").order(:name)
    @medium = Tag.where(category: "Medium").order(:name)
    @misc = Tag.where(category: "Misc").order(:name)
    @museum = Museum.find(params[:id])
    @tagging = Tagging.new
  end

  def tagging_create
    @museum = Museum.find(params[:id])
    @museum.taggings.destroy_all
    museum_params[:tag_ids].each do |tag|
      if tag != ""
        @tagging = @museum.taggings.new(tag_id: tag.to_i)
        @tagging.save
        Rails.logger.info(@tagging.errors.inspect)
      end
    end
    redirect_to museum_path(@museum)
  end

  def edit
    @museum = Museum.find(params[:id])
  end

  def destroy
    @museum = Museum.find(params[:id])
    @museum.destroy
    redirect_to :root
  end

  private

  def museum_params
    params.require(:museum).permit(:name, :transportation_info, :blurb, :website, :opening_time, :closing_time, :description, :photo, :address, :price, :ticketsite, :sun_open, :sun_close, :mon_open, :mon_close, :tue_open, :tue_close, :wed_open, :wed_close, :thu_open, :thu_close, :fri_open, :fri_close, :sat_open, :sat_close, :tag_ids => [])
  end

end
