json.extract! @recipe, :title, :body, :image_url, :id
json.author @recipe.author.email
json.annotations @recipe.annotations, :id, :body, :start_idx, :end_idx
