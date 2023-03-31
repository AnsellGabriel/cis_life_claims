class ClaimBeneficiary < ApplicationRecord
  belongs_to :process_claim
  Relation = ["Father", "Mother", "Siblings", "Spouse", "Children"]
end
