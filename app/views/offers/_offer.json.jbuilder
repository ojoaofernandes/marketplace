json.extract! offer, :id, :title, :category, :price, :description, :photos, :created_at, :updated_at
json.url offer_url(offer, format: :json)