class ClaimRemark < ApplicationRecord
  belongs_to :process_claim
  Status =[
   "Approved",
   "Denied",
   "Pending",
   "Reconsider"
  ]
end
