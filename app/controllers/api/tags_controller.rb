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
    @tag = Tag.find_by(label: params[:tag])
    render :show
  end

  private
  def tag_params
    params.require(:tag).permit(:label)
  end
end
