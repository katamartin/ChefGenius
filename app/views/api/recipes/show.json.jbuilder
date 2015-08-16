json.extract! @recipe, :title, :body, :image_url, :id
json.author @recipe.author.email
json.author_id @recipe.author.id
json.annotations @recipe.annotations do |annotation|
  json.extract! annotation, :id, :body, :start_idx, :end_idx
  json.comments annotation.comments do |comment|
    json.id comment.id
    json.body comment.body
    json.author comment.author.email
    json.author_id comment.author.id
  end
end
json.tags @recipe.tags, :label, :id
json.comments @recipe.comments do |comment|
  json.id comment.id
  json.body comment.body
  json.author comment.author.email
  json.author_id comment.author.id
end
