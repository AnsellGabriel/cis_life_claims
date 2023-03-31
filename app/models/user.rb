class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  validates_presence_of :user_name
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  :confirmable, :trackable
  belongs_to :branch, optional: true
  belongs_to :authority_level, optional: true

  def to_s 
    user_name
  end
  

end
