json.extract! comment, :id, :body, :vote_count, :author_id
json.author comment.author.email
vote = comment.votes.select { |vote| vote.user_id == current_user.id }[0]
if vote
  json.vote do
    json.extract! vote, :id, :value
  end
end
