json.extract! ingredient, :id, :name, :calories, :unit, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
