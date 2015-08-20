class Api::RecipesController < ApplicationController
  def index
    if params[:query] || params["query"]
      @recipes = Recipe.
                   includes(:author, :tags).
                   where("recipes.title LIKE '%#{params[:query]}%'")
    else
      @recipes = Recipe.includes(:author, :image).all
    end
    render :index
  end

  def create
    tag_ids = []
    params[:tags].each do |tag|
      id = Tag.findOrCreate(tag).id
      tag_ids << id if id
    end
    @recipe = current_user.recipes.new(recipe_params.
      merge(tag_ids: tag_ids).
      merge(image_ids: params[:image_ids])
    )
    if @recipe.save
      render :show
    else
      render json: @recipe.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @recipe = Recipe.
      includes(
        :author,
        :tags,
        :image,
        annotations: [:votes, comments: [:votes, :author]],
        comments: [:votes, :author]
      ).
      find(params[:id])
    render :show
  end

  def search
    @recipes = Recipe.includes(:author).all
    render :search
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image_ids)
  end
end
