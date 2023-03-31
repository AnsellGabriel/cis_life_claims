class ClaimDocument < ApplicationRecord
  belongs_to :process_claim
  belongs_to :document
  has_one_attached :file
end
