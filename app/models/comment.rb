class Comment < ActiveRecord::Base
  validates :commentable, :body, :author, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :author
end
