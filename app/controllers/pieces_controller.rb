class PiecesController < ApplicationController
  before_action :administrative, only: [:new, :create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :tagging_create

  def show
    @piece = Piece.find(params[:id])
    if !@piece.museum_id.nil?
      @museum = Museum.find(@piece.museum_id)
    end
    @ticket = current_order.tickets.new
    @hash = Gmaps4rails.build_markers(@museum) do |museum, marker|
      marker.lat museum.latitude
      marker.lng museum.longitude
    end
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new(piece_params)
    if @piece.save
      check_external_url
      redirect_to :root
    else
      @errors = @piece.errors.full_messages
      render :"pieces/new"
    end
  end

  def update
    @piece = Piece.find(params[:id])
    if @piece.update(piece_params)
      check_external_url
      redirect_to :root
    else
      render :"pieces/edit"
    end
  end

  def tagging_new
    @piece = Piece.find(params[:id])
    @tagging = Tagging.new
  end

  def tagging_create
    @piece = Piece.find(params[:id])
    piece_params[:tag_ids].each do |tag|
      if tag != ""
        @tagging = @piece.taggings.new(tag_id: tag.to_i)
        @tagging.save
        Rails.logger.info(@tagging.errors.inspect)
      end
    end
    redirect_to piece_path(@piece)
  end

  def edit
    @piece = Piece.find(params[:id])
  end

  def destroy
    @piece = Piece.find(params[:id])
    @piece.destroy
    redirect_to :root
  end

  private

  def piece_params
    params.require(:piece).permit(:name, :blurb, :external_url, :main, :description, :photo, :museum_id, :tag_ids => [])
  end

  def check_external_url
    if @piece.external_url == ""
      @piece.update(external_url: nil)
    end
  end
end
