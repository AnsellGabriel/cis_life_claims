class ClaimTrack < ApplicationRecord
  belongs_to :process_claim
  belongs_to :user
  belongs_to :claim_route
end
