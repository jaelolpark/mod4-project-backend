class User < ApplicationRecord
  # has_secure_password
  #has to be commended out for seeding

  has_many :reservations
  has_many :rooms, through: :reservations 

  # validates :username, {uniqueness: true}
  # validates :email, {uniqueness: true}



  def full_name
		[self.first_name, ' ', self.last_name].join
  end
  
end
