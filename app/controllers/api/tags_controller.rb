class Api::TagsController < ApplicationController
  before_action :redirect_unless_logged_in

  def show
    @tag = Tag.
      includes(recipes: [:author, :image]).
      find(params[:id])
    render :show
  end

  def index
    @tags = Tag.includes(:taggings).all
    render :index
  end

  private
  def tag_params
    params.require(:tag).permit(:label)
  end
end
