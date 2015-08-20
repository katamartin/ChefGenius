json.extract! @recipe, :title, :body, :id, :author_id
json.author @recipe.author.email
if @recipe.image
  json.image @recipe.image, :id, :url
end
json.annotations @recipe.annotations, partial: 'api/annotations/annotation', as: :annotation
json.tags @recipe.tags, :label, :id
json.comments @recipe.comments, partial: 'api/comments/comment', as: :comment
