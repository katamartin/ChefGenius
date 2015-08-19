json.array! @tags do |tag|
  json.id tag.id
  json.name tag.label
end
