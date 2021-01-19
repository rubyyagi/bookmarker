json.extract! bookmark, :id, :title, :url, :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)
