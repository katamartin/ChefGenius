class Vote < ActiveRecord::Base
  validates :user, :votable, :value, presence: true
  validates :value, inclusion: { in: [-1, 1] }
  belongs_to :user
  belongs_to :votable, polymorphic: true
end
