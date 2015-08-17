json.(@user, :id, :email)

json.recipes @user.recipes do |recipe|
  json.(recipe, :id, :title, :created_at)
end

json.annotations @user.annotations do |annotation|
  json.recipe annotation.recipe, partial: 'api/recipes/recipe', as: :recipe
  json.body annotation.body
  json.start_idx annotation.start_idx
  json.end_idx annotation.end_idx
  json.date annotation.created_at
end

json.comments @user.comments do |comment|
  json.body comment.body
  json.date comment.created_at
  json.commentable_type comment.commentable_type
  if comment.commentable_type == "Recipe"
    json.recipe comment.commentable, partial: 'api/recipes/recipe', as: :recipe
  else
    json.annotation comment.commentable, partial: 'api/annotations/annotation_commentable', as: :annotation
  end
end
