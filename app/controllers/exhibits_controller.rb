class ExhibitsController < ApplicationController
  before_action :administrative, only: [:new, :create, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :tagging_create


  def search_show
    @all_posts = Museum.all + Exhibit.all + Event.all + Piece.all + Tag.all
    @ticket = current_order.tickets.new
    @posts = []
    @term = params[:search].downcase
    if params[:search]
      if params[:tag_search]
        @all_posts.each do |post|
          params[:tag_search].each do |param|
            if post.is_a?(Tag)
              if post.name.downcase.include?(param)
                @posts << post
              end
            elsif (post.name.downcase.include?(@term) && post.tags.any? {|attribute| attribute.name == param}) || (post.description.downcase.include?(@term) &&  post.tags.any? {|attribute| attribute == param})
              @posts << post
              end
            end
          end
        puts params[:tag_search]
      else
        @all_posts.each do |post|
          if post.is_a?(Tag)
            if post.name.downcase.include?(@term)
              @posts << post
            end
          else
            if post.name.downcase.include?(@term) || post.description.downcase.include?(@term)
              @posts << post
            end
          end
        end
      end
    else
      @posts = @all_posts.all.order('created_at DESC')
    end
    @posts = @posts.uniq
  end


  def search_new
    @all_posts = Museum.all + Exhibit.all + Event.all + Piece.all + Tag.all
    @tags = Tag.all
  end

  def show
    @exhibit = Exhibit.find(params[:id])
    @museum = Museum.find(@exhibit.museum_id)
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
      render :"exhibits/new"
    end
  end

  def update
    @exhibit = Exhibit.find(params[:id])
    if @exhibit.update(exhibit_params)
      redirect_to :root
    else
      render :"post/edit"
    end
  end

  def tagging_new
    @exhibit = Exhibit.find(params[:id])
    @tagging = Tagging.new
  end

  def tagging_create
    @exhibit = Exhibit.find(params[:id])
    exhibit_params[:tag_ids].each do |tag|
      if tag != ""
        @tagging = @exhibit.taggings.new(tag_id: tag.to_i)
        @tagging.save
        Rails.logger.info(@tagging.errors.inspect)
      end
    end
    redirect_to exhibit_path(@exhibit)
  end

  def edit
    @exhibit = Exhibit.find(params[:id])
  end

  def destroy
    @exhibit = Exhibit.find(params[:id])
    @exhibit.destroy
    redirect_to :root
  end

  private

  def exhibit_params
    params.require(:exhibit).permit(:name, :blurb, :description, :photo, :start_date, :end_date, :museum_id, :tag_ids => [])
  end
  end
