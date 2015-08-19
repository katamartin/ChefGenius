class Recipe < ActiveRecord::Base
  validates :title, :author, :body, presence: true

  belongs_to(
    :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many :annotations, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :comments, as: :commentable
  has_many(
    :tags,
    through: :taggings,
    source: :tag
  )

  has_one(
    :recipe,
    class_name: :Recipe,
    foreign_key: :id,
    primary_key: :id
  )

  has_one :recipe_image
  has_one(
    :image,
    through: :recipe_image,
    source: :image
  )
end
