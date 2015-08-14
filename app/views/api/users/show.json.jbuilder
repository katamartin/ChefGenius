json.(@user, :id, :email)

json.recipes @user.recipes do |recipe|
  json.(recipe, :id, :title, :created_at)
end

json.annotations @user.annotations do |annotation|
  json.recipe do
    json.id annotation.recipe.id
    json.title annotation.recipe.title
    json.author do
      json.email annotation.recipe.author.email
      json.id annotation.recipe.author.id
    end
  end
  json.date annotation.created_at
end

json.comments @user.comments do |comment|
  json.commentable do
    json.title comment.commentable.title
    json.type comment.commentable_type
    json.id comment.commentable_id
    json.author do
      json.email comment.commentable.author.email
      json.id comment.commentable.author.id
    end
  end
  json.date comment.created_at
end
