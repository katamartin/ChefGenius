class Api::TagsController < ApplicationController
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      render :show
    else
      render json: @tag.errors.full_messages
    end
  end

  def show
    @tag = Tag.
      includes(recipes: [:author]).
      find(params[:id])
    render :show
  end

  def index
    @tags = Tag.all
    render :index
  end

  private
  def tag_params
    params.require(:tag).permit(:label)
  end
end
