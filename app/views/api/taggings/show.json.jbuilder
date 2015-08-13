json.tag do
  json.label @tagging.tag
  json.recipes @tagging.tag.recipes do |recipe|
    json.title recipe.title
    json.author recipe.author.email
  end
end
