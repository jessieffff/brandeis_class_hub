json.extract! course, :id, :calendar_id, :name, :start_date, :end_date, :location, :professor_first_name, :professor_last_name, :repetition_frequency, :url, :created_at, :updated_at
json.url course_url(course, format: :json)
