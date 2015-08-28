class Api::TaggingsController < ApplicationController
  before_action :redirect_unless_logged_in

  def create
    @tagging = Tagging.new(tagging_params)
    if @tagging.save
      render :show
    else
      render json: @tagging.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def tagging_params
    params.require(:tagging).permit(:recipe_id, :tag_id)
  end
end
