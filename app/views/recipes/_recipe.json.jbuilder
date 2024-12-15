json.extract! recipe, :id, :title, :instructions, :prep_time, :servings, :user_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
