json.extract! course, :id, :professor_first_name, :professor_last_name, :name, :subject, :created_at, :updated_at
json.url course_url(course, format: :json)
