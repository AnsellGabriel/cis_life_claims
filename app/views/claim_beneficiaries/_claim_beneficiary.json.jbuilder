json.extract! claim_beneficiary, :id, :process_claim_id, :name, :birthdate, :relationship, :created_at, :updated_at
json.url claim_beneficiary_url(claim_beneficiary, format: :json)
