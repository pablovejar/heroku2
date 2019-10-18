json.extract! dish, :id, :name, :price, :description, :quantity, :rating, :created_at, :updated_at
json.url dish_url(dish, format: :json)
