class TaggingsController < ApplicationController

  def new
    @tagging = Tagging.new
    @type = params[:type]
    @type_id = params[:type_id]
    @tag = Tag.new
  end

  def create
    @tagging = Tagging.new
    if find_object(params[:type], params[:type_id]) #returns db object
      @tag = Tag.new({name: params[:name], category: params[:category]})

      if @tag.save
        @tagging.tag_id = @tag.id
        @tagging.save

        redirect_to "/#{params[:type]}s/#{params[:type_id]}/tagging"
      else
        @tag_errors = @tag.errors.full_messages
        render :"taggings/new"
      end
    else
      render :"taggings/new"
    end
  end

  private

  def find_object(type, t_id)
    case type
    when 'event'
      @tagging.event_id = t_id
      return Event.find(t_id)
    when 'museum'
      @tagging.museum_id = t_id
      return Museum.find(t_id)
    when 'exhibit'
      @tagging.exhibit_id = t_id
      return Exhibit.find(t_id)
    when 'piece'
      @tagging.piece_id = t_id
      return Piece.find(t_id)
    else
      return nil
    end
  end
end
