require 'active_support/core_ext'

class Comment < ActiveRecord::Base
  validates :commentable, :body, :author, presence: true
  belongs_to :commentable, polymorphic: true

  belongs_to(
    :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id
  )

  has_many :votes, as: :votable
  has_many :voters, through: :votes, source: :user

  def vote_count
    votes.inject(0) { |accum, el| accum + el.value }
  end

  def formatted_date
    created_at.strftime("on %b %d, %Y at %I:%M%p")
  end
end
