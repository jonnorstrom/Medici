class ExhibitsController < ApplicationController
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
    params.require(:exhibit).permit(:name, :blurb, :description, :museum_id, :start_date, :end_date)
  end
end
