class Image < ActiveRecord::Base
  has_many :recipe_images
  has_many(
    :recipes,
    through: :recipe_images,
    source: :recipe
  )
end
