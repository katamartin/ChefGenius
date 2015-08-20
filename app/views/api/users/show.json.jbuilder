json.(@user, :id, :email)

json.recipes @user.recipes do |recipe|
  json.(recipe, :id, :title, :created_at)
end

json.annotations @user.annotations do |annotation|
  json.recipe annotation.recipe, partial: 'api/recipes/recipe', as: :recipe
  json.(annotation, :body, :start_idx, :end_idx, :formatted_date)
end

json.comments @user.comments do |comment|
  json.(comment, :body, :formatted_date, :commentable_type)
  if comment.commentable_type == "Recipe"
    json.recipe comment.commentable, partial: 'api/recipes/recipe', as: :recipe
  else
    json.annotation comment.commentable, partial: 'api/annotations/annotation_commentable', as: :annotation
  end
end
