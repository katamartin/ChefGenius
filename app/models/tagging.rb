class Tagging < ActiveRecord::Base
  validates :tag, :recipe, presence: true

  belongs_to :tag
  belongs_to :recipe
end
