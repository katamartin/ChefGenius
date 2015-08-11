class Api::RecipesController < ApplicationController
  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      render :show
    else
      render json: @recipe.errors.full_messages
    end
  end

  def show
    render :show
  end

  def index
    @recipes = Recipe.all
    render :index
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image_url)
  end
end
