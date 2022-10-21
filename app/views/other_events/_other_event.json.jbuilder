json.extract! other_event, :id, :calendar_id, :other_name, :start_time, :end_time, :created_at, :updated_at
json.url other_event_url(other_event, format: :json)
