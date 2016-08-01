json.extract! cliente, :id, :nombre, :correo, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)