class Api::TaggingsController < ApplicationController
  def create
    @tagging = Tagging.new(tagging_params)
    if @tagging.save
      render :show
    else
      render json: @tagging.errors.full_messages
    end
  end

  private
  def tagging_params
    params.require(:tagging).permit(:recipe_id, :tag_id)
  end
end
