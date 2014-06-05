json.array!(@description_items) do |description_item|
  json.extract! description_item, :id, :title, :long_description, :project_id
  json.url description_item_url(description_item, format: :json)
end
