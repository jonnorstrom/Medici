class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :tagging_create

  def show
    @event = Event.find(params[:id])
    @museum = Museum.find(@event.museum_id)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to :root
    else
      @errors = @event.errors.full_messages
      render :"events/new"
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to :root
    else
      render :"post/edit"
    end
  end

  def tagging_new
    @event = Event.find(params[:id])
    @tagging = Tagging.new
  end

  def tagging_create
    @event = Event.find(params[:id])
    event_params[:tag_ids].each do |tag|
      if tag != ""
        @tagging = @event.taggings.new(tag_id: tag.to_i)
        @tagging.save
        Rails.logger.info(@tagging.errors.inspect)
      end
    end
    redirect_to event_path(@event)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to :root
  end

  private

  def event_params
    params.require(:event).permit(:name, :blurb, :description, :photo, :start_date, :end_date, :museum_id, :tag_ids => [])
  end
end
