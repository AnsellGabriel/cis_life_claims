json.extract! claim_cause, :id, :acd, :ucd, :osccd, :process_claim_id, :created_at, :updated_at
json.url claim_cause_url(claim_cause, format: :json)
