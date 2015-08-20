json.extract! annotation, :id, :body, :start_idx, :end_idx, :vote_count, :formatted_date, :author_id
vote = annotation.votes.select { |vote| vote.user_id == current_user.id }[0]
json.comments annotation.comments, partial: 'api/comments/comment', as: :comment
if vote
  json.vote do
    json.extract! vote, :id, :value
  end
end
json.author annotation.author.email
