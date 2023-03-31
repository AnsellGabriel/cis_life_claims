json.extract! claim_document, :id, :process_claim_id, :document_id, :created_at, :updated_at
json.url claim_document_url(claim_document, format: :json)
