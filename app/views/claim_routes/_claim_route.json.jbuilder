json.extract! claim_route, :id, :name, :description, :created_at, :updated_at
json.url claim_route_url(claim_route, format: :json)
