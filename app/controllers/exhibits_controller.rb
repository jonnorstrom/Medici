class ExhibitsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def search
    @all_posts = Museum.all + Exhibit.all + Event.all + Piece.all
    @posts = []
    @term = params[:search].downcase
    if params[:search]
      @all_posts.each do |post|
        if post.name.downcase.include?(@term)
          @posts << post
        elsif post.description.downcase.include?("%#{params[:search].downcase}%")
          @posts << post
        end
      end
    else
      @posts = @all_posts.all.order('created_at DESC')
    end
  end

  def show
    @exhibit = Exhibit.find(params[:id])
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
      render :"museums/new"
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def exhibit_params
    params.require(:exhibit).permit(:name, :blurb, :description, :museum_id, :start_date, :end_date, :photo)
  end
end
