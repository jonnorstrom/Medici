class MuseumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :tagging_create

  def index
    @ticket = current_order.tickets.new
    @posts = Museum.all + Exhibit.all + Event.all + Piece.all

  end

  def show
    @museum = Museum.find(params[:id])
    @ticket = current_order.tickets.new
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
      render :"post/edit"
    end
  end

  def tagging_new
    @museum = Museum.find(params[:id])
    @tagging = Tagging.new
  end

  def tagging_create
    @museum = Museum.find(params[:id])
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
    params.require(:museum).permit(:name, :blurb, :description, :photo, :address, :price, :tag_ids => [])
  end

end
