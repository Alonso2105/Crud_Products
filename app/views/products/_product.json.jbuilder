json.extract! product, :id, :name, :price, :sku, :is_seasonal, :image, :quantity, :category, :created_at, :updated_at
json.url product_url(product, format: :json)
