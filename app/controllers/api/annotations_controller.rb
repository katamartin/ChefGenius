class Api::AnnotationsController < ApplicationController
  before_action :redirect_unless_logged_in

  def create
    @annotation = current_user.annotations.new(annotation_params)
    if @annotation.save
      @recipe = @annotation.recipe
      render :show
    else
      render json: @annotation.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @annotation = Annotation.find(params[:id])
    @recipe = @annotation.recipe
    @annotation.try(:destroy)
    render json: @recipe
  end

  def show
    @annotation = Annotation.find(params[:id])
    render :show
  end

  private
  def annotation_params
    params.require(:annotation).permit(:recipe_id, :start_idx, :end_idx, :body)
  end
end
