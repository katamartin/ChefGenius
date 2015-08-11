json.extract! @recipe, :title, :body, :image_url
json.author @recipe.author.email
