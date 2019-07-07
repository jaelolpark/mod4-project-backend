class UserSerializer < ActiveModel::Serializer
  has_many :reservations
  has_many :rooms, through: :reservations

  attributes :id, :first_name, :last_name, :username, :email, :phone_number, :address, :password_digest
end
