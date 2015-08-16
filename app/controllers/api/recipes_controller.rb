class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:author).all
    render :index
  end

  def create
    tag_ids = []
    params[:tags].each do |tag|
      id = Tag.findOrCreate(tag).id
      tag_ids << id if id
    end
    @recipe = current_user.recipes.new(recipe_params.merge(tag_ids: tag_ids))
    if @recipe.save
      render :show
    else
      render json: @recipe.errors.full_messages
    end
  end

  def show
    @recipe = Recipe.
      includes(:author, :tags ,annotations: [comments: [:author]], comments: [:author]).
      find(params[:id])
    render :show
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image_url)
  end
end
