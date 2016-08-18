class MuseumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @ticket = current_order.tickets.new
    @museums = Museum.all + Exhibit.all

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
    params.require(:museum).permit(:name, :blurb, :description, :photo, :address)
  end

end
