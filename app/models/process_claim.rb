class ProcessClaim < ApplicationRecord
  belongs_to :cooperative
  belongs_to :coop_branch, optional: true
  belongs_to :plan
  belongs_to :agent
  belongs_to :geo_region
  belongs_to :geo_province
  belongs_to :geo_municipality
  belongs_to :geo_barangay
  belongs_to :cause
  belongs_to :claim_route
  has_many :claim_benefits
  has_many :claim_coverages
  has_many :claim_beneficiaries
  has_many :claim_distributions
  has_many :claim_confinements
  has_many :claim_remarks
  has_one :claim_cause, dependent: :destroy
  has_one :claim_tracktab, dependent: :destroy
  has_many :claim_tracks, dependent: :destroy
  has_many :claim_documents, dependent: :destroy
  accepts_nested_attributes_for :claim_cause
  Insure_type = ["Principal", "Dependent"]
  Units =[
    "Unit 1",
    "Unit 2",
    "Unit 3",
    "Unit 4",
    "Unit 5"
  ]
  Suffix = ["SR", "JR", "II", "III", "IV", "V"]
  Gender = ["Male", "Female", "Others"]
  Status = ["Approved", "Denied", "Pending", "On-process"]
  
  
  def get_address 
    geo_province.name + ', ' + geo_municipality.name + ', ' + geo_barangay.name + ', ' + 
    # "#{self.street}"
    street
  end
  def get_fullname 
    lastname + ', ' + firstname + ' ' + middlename + ', ' + suffix
  end
  def get_benefit_claim_total(pc) 
    ClaimBenefit.where(process_claim: pc).where.not(status: "Denied").sum(:amount)
  end
end
