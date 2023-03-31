class ClaimCause < ApplicationRecord
  belongs_to :process_claim
  def to_s 
    name
  end
end
