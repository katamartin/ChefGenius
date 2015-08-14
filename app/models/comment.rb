class Comment < ActiveRecord::Base
  validates :commentable, :body, :author, presence: true
  belongs_to :commentable, polymorhpic: true
end
