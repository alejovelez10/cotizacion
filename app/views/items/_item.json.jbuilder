json.extract! item, :id, :nombre, :precio, :category_id, :created_at, :updated_at
json.url item_url(item, format: :json)