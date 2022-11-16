json.extract! company, :id, :name, :manager, :status, :terms, :created_at, :updated_at
json.url company_url(company, format: :json)
