json.array!(@newsitems) do |newsitem|
  json.extract! newsitem, :title, :description, :date, :user_id
  json.url newsitem_url(newsitem, format: :json)
end
