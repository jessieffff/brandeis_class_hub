json.extract! event, :id, :calendar_id, :event_id, :event_category, :created_at, :updated_at
json.url event_url(event, format: :json)
