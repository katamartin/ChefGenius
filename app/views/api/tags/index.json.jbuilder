json.array! @tags do |tag|
  json.label = tag.label
  json.count = tag.taggings.length
end
