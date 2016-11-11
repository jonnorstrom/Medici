class EventsController < ApplicationController
  before_action :administrative, only: [:new, :create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :tagging_create

  def show
    p "IN EVENTS#SHOW"
    @show_page = true
    @event = Event.find(params[:id])
    @ticket = current_order.tickets.new
    @hash = Gmaps4rails.build_markers(@event) do |museum, marker|
      marker.lat museum.latitude
      marker.lng museum.longitude
    end
    @other_events = Event.all.where("end_date > ?", Date.today)
    @other_events = @other_events.to_a - [@event]
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
      render :"event/edit"
    end
  end

  def tagging_new
    @type_museum = Tag.where(category: "Type of Museum").order(:name)
    @type_art = Tag.where(category: "Type of Art").order(:name)
    @medium = Tag.where(category: "Medium").order(:name)
    @misc = Tag.where(category: "Misc").order(:name)
    @event = Event.find(params[:id])
    @tagging = Tagging.new
  end

  def tagging_create
    @event = Event.find(params[:id])
    @event.taggings.destroy_all
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
    params.require(:event).permit(:name, :blurb, :transportation_info, :address, :website, :description, :photo, :opening_time, :closing_time, :start_date, :price, :end_date, :main, :museum_id, :ticketsite, :ticketable, :tag_ids => [])
  end
end
