json.extract! @recipe, :title, :body, :image_url, :id
json.author @recipe.author.email
