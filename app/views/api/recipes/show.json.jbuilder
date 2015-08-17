json.extract! @recipe, :title, :body, :image_url, :id
json.author @recipe.author.email
json.author_id @recipe.author.id
json.annotations @recipe.annotations do |annotation|
  json.extract! annotation, :id, :body, :start_idx, :end_idx
  json.voteCount annotation.vote_count
  vote = annotation.votes.select { |vote| vote.user_id == current_user.id }[0]
  if vote
    json.vote do
      json.extract! vote, :id, :value
    end
  end
  json.comments annotation.comments do |comment|
    json.id comment.id
    json.body comment.body
    json.author comment.author.email
    json.author_id comment.author.id
    json.voteCount comment.vote_count
    vote = comment.votes.select { |vote| vote.user_id == current_user.id }[0]
    if vote
      json.vote do
        json.extract! vote, :id, :value
      end
    end
  end
end
json.tags @recipe.tags, :label, :id
json.comments @recipe.comments do |comment|
  json.id comment.id
  json.body comment.body
  json.author comment.author.email
  json.author_id comment.author.id
  json.voteCount comment.vote_count
  vote = comment.votes.select { |vote| vote.user_id == current_user.id }[0]
  if vote
    json.vote do
      json.extract! vote, :id, :value
    end
  end
end
