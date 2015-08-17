json.extract! @recipe, :title, :body, :image_url, :id
json.author @recipe.author.email
json.author_id @recipe.author.id
json.annotations @recipe.annotations, partial: 'api/annotations/annotation', as: :annotation
json.tags @recipe.tags, :label, :id
json.comments @recipe.comments, partial: 'api/comments/comment', as: :comment
