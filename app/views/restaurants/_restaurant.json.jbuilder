json.extract! restaurant, :id, :name, :mail, :address, :rating, :phone, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
