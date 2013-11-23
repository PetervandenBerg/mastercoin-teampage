json.array!(@resources) do |resource|
  json.extract! resource, :title, :description
  json.url resource_url(resource, format: :json)
end
