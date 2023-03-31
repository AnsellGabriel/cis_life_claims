json.extract! claim_remark, :id, :process_claim_id, :user, :status, :remarks, :created_at, :updated_at
json.url claim_remark_url(claim_remark, format: :json)
