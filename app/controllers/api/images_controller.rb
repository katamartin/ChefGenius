class Api::ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    if @image.save
      render :show
    else
      render json: @image.errors.full_messages
    end
  end

  def show
    @image = Image.find(params[:id])
    render :show
  end

  private
  def image_params
    params.require(:image).permit(:url)
  end
end
