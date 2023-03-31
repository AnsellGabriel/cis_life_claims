class ClaimCoverage < ApplicationRecord
  belongs_to :process_claim, optional: true
  Coverage_status = ["Current", "Previous"]
  Status = ["Approve", "Denied"]
end
