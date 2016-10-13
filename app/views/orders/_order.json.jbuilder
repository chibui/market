json.extract! order, :id, :approved, :shipped, :created_at, :updated_at
json.url order_url(order, format: :json)