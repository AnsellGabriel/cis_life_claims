class CoopBranch < ApplicationRecord
  belongs_to :cooperative

  def to_s 
    name
  end
end
