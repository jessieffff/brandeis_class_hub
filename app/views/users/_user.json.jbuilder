json.extract! user, :id, :user_id, :first_name, :last_name, :student_id, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
