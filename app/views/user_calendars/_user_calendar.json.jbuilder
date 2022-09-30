json.extract! user_calendar, :id, :user_id, :calendar_id, :created_at, :updated_at
json.url user_calendar_url(user_calendar, format: :json)
