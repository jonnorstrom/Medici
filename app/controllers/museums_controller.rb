class MuseumsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @museums = Museum.all
    @exhibits = Exhibit.all
  end

  def show
    @museum = Museum.find(params[:id])
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
  end

  def edit
  end

  def destroy
  end

end
