json.extract! order, :id, :price, :payment, :delivery_address, :delivery_time, :status, :notes, :created_at, :updated_at
json.url order_url(order, format: :json)
