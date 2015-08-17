json.extract! comment, :id, :body
json.author comment.author.email
json.author_id comment.author.id
json.voteCount comment.vote_count
vote = comment.votes.select { |vote| vote.user_id == current_user.id }[0]
if vote
  json.vote do
    json.extract! vote, :id, :value
  end
end
