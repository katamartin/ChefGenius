json.extract! @recipe, :title, :body, :image_url, :id, :author_id
json.author @recipe.author.email
json.images @recipe.images do |image|
  json.id image.id
  json.url image.url
end
json.annotations @recipe.annotations, partial: 'api/annotations/annotation', as: :annotation
json.tags @recipe.tags, :label, :id
json.comments @recipe.comments, partial: 'api/comments/comment', as: :comment
