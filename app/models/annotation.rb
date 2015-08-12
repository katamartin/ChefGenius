class Annotation < ActiveRecord::Base
  validates :author, :recipe, :body, :start_idx, :end_idx, presence: true
  validate :non_overlapping

  belongs_to(
    :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id
  )

  belongs_to :recipe

  def non_overlapping
    recipe.annotations.each do |annotation|
      range = (annotation.start_idx..annotation.end_idx)
      if range.include?(start_idx) || range.include?(end_idx)
        errors.add(:range, "Annotations cannot overlap")
        return
      end
    end
  end
end
