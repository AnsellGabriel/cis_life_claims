class Reconsider < ApplicationRecord
  belongs_to :process_claim
  belongs_to :claim_route
  belongs_to :user
end
