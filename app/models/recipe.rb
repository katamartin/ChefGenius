class Recipe < ActiveRecord::Base
  validates :title, :author, :body, presence: true

  belongs_to(
    :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id
  )

end
