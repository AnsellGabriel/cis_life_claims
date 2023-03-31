json.extract! claim_distribution, :id, :process_claim_id, :name, :amount_type, :amount, :created_at, :updated_at
json.url claim_distribution_url(claim_distribution, format: :json)
