json.extract! user, :id, :user_name, :branch_id, :authority_level_id, :created_at, :updated_at
json.url user_url(user, format: :json)
