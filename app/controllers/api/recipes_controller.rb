class Api::RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    render :index
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      render :show
    else
      render json: @recipe.errors.full_messages
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render :show
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image_url)
  end
end
