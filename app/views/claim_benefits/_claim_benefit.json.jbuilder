json.extract! claim_benefit, :id, :process_claim_id, :benefit_id, :amount, :status, :created_at, :updated_at
json.url claim_benefit_url(claim_benefit, format: :json)
