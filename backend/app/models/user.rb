class User < ApplicationRecord
  has_many :rooms, through: :reservation
  has_many :reservations

  has_secure_password 

  def full_name
		[self.first_name, ' ', self.last_name].join
  end
  
end
