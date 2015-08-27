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

  def recipe
    self
  end

  has_one :recipe_image
  has_one(
    :image,
    through: :recipe_image,
    source: :image
  )

  def self.default_image_url
    "https://images.unsplash.com/photo-1438010276863-4befc0046f93?q=80&fm=jpg&s=095835bdf078cdbca81bac4fcc925fe9"
  end
end
