class ClaimDistribution < ApplicationRecord
  belongs_to :process_claim
  AmountType = [ "Principal", "Outstanding", "Balance" ]
end
