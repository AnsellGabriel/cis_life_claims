class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def to_s 
    name
  end
end
