class Room < ApplicationRecord
  has_many :users, through: :reservation
  belongs_to :reservation
end
