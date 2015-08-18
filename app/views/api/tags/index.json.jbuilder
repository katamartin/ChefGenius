json.array! @tags do |tag|
  json.label tag.label
  json.count tag.taggings.length
  json.id tag.id
end
