class RecipeImage < ActiveRecord::Base
  belongs_to :image, dependent: :destroy
  belongs_to :recipe, dependent: :destroy
end
