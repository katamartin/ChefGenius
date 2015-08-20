json.extract! @comment, :id, :body, :vote_count, :formatted_date
json.author @comment.author.email
json.author_id @comment.author.id
