class PiecesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :tagging_create

  def show
    @piece = Piece.find(params[:id])
    @museum = Museum.find(@piece.museum_id)
  end

  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.new(piece_params)
    if @piece.save
      redirect_to :root
    else
      @errors = @piece.errors.full_messages
      render :"pieces/new"
    end
  end

  def update
    @piece = Piece.find(params[:id])
    if @piece.update(piece_params)
      redirect_to :root
    else
      render :"post/edit"
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
    params.require(:piece).permit(:name, :blurb, :description, :photo, :museum_id, :tag_ids => [])
  end
end
