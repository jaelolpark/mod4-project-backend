# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'faker'

User.destroy_all
Room.destroy_all
Reservation.destroy_all

rooms_file = File.read("./rooms.json")
rooms_hash = JSON.parse(rooms_file)


rooms_hash.each do |rm|
    Room.create(
        name: rm["name"],
        slug: rm["slug"],
        # type: rm["type"],
        ##rails doesn't like it when we use "type" as a category
        price: rm["price"],
        capacity: rm["capacity"],
        pets: rm["pets"],
        breakfast: rm["breakfast"],
        featured: rm["featured"],
        description: rm["description"]
    )
end

10.times do
    User.create(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Internet.username,
        email: Faker::Internet.email,
        phone_number: Faker::PhoneNumber.cell_phone,
        address: Faker::Address.street_address)
end

20.times do
    Reservation.create(
        user_id: User.all.sample.id,
        room_id: Room.all.sample.id)
end