json.(@user, :id, :email)

json.recipes @user.recipes do |recipe|
  json.(recipe, :id, :title, :created_at)
end

json.annotations @user.annotations do |annotation|
  json.recipe do
    json.id annotation.recipe.id
    json.title annotation.recipe.title
    json.body annotation.recipe.body
    json.author do
      json.email annotation.recipe.author.email
      json.id annotation.recipe.author.id
    end
  end
  json.body annotation.body
  json.start_idx annotation.start_idx
  json.end_idx annotation.end_idx
  json.date annotation.created_at
end

json.comments @user.comments do |comment|
  json.body comment.body
  json.date comment.created_at
  json.commentable_type comment.commentable_type
  # json.commentable do
  #   json.id comment.commentable_id
  #   if comment.commentable_type == "Recipe"
  #     json.title comment.commentable.title
  #   else
  #     json.start_idx comment.commentable.start_idx
  #     json.end_idx comment.commentable.end_idx
  #     json.recipe do
  #       json.title comment.commentable.recipe.title
  #       json.id comment.commentable.recipe.id
  #       json.body comment.commentable.recipe.body
  #     end
  #   end
  #   json.author do
  #     json.email comment.commentable.author.email
  #     json.id comment.commentable.author.id
  #   end
  # end

  if comment.commentable_type == "Recipe"
    json.recipe do
      json.id comment.commentable_id
      json.title comment.commentable.title
      json.author do
        json.email comment.commentable.author.email
        json.id comment.commentable.author.id
      end
    end
  else
    json.annotation do
      json.start_idx comment.commentable.start_idx
      json.end_idx comment.commentable.end_idx
      json.recipe do
        json.title comment.commentable.recipe.title
        json.id comment.commentable.recipe.id
        json.body comment.commentable.recipe.body
      end
      json.author do
        json.email comment.commentable.author.email
        json.id comment.commentable.author.id
      end
    end
  end
end
