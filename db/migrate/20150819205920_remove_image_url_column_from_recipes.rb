class RemoveImageUrlColumnFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :image_url
  end
end
