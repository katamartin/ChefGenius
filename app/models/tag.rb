class Tag < ActiveRecord::Base
  validates :label, presence: true, uniqueness: true

  has_many :taggings, dependent: :destroy
  has_many(
    :recipes,
    through: :taggings,
    source: :recipe
  )

  def self.findOrCreate(label)
    tag = self.find_by(label: label) || self.create(label: label)
    tag
  end
end
