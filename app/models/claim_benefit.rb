class ClaimBenefit < ApplicationRecord
  belongs_to :process_claim, optional: true
  belongs_to :benefit

  validates_presence_of :amount
  Status =[
   "Approved",
   "Denied",
   "Pending"
  ]
  def claim_benefit_amount(process_claim)
    
    ClaimBenefit.where.not(status: "Denied").sum(:amount)
  end
end
