class Tag < ActiveRecord::Base
  validates :label, presence: true, uniqueness: true

  has_many :taggings
  has_many(
    :recipes,
    through: :taggings,
    source: :recipe
  )
end
