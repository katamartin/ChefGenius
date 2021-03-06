class Api::RecipesController < ApplicationController
  before_action :redirect_unless_logged_in

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
      id = Tag.findOrCreate(tag.downcase).id
      tag_ids << id if id
    end
    @recipe = current_user.recipes.new(recipe_params.merge(tag_ids: tag_ids))
    @recipe.image= Image.find(params[:image_id]) if params[:image_id]
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
        :image,
        :tags,
        annotations: [:votes, :author, comments: [:votes, :author]],
        comments: [:votes, :author]
      ).
      find(params[:id])
    render :show
  end

  def search
    @recipes = Recipe.includes(:author).all
    render :search
  end

  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.try(:destroy)
    render :show
  end

  private
  def recipe_params
    params.require(:recipe).permit(:title, :body, :image_ids)
  end
end
