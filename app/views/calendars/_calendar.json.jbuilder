json.extract! calendar, :id, :name, :description, :user_id, :shared, :invite_token, :created_at, :updated_at
json.url calendar_url(calendar, format: :json)
