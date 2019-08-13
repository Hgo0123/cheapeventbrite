# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'


10.times do |i|
number = [10,20, 30, 40, 55, 60]
user = User.create(first_name: Faker::Creature::Dog.name, last_name: Faker::Games::Pokemon.name, email: "user#{i}@yopmail.com", password: "kikiki")
event =Event.create(start_date: Faker::Date.forward(days: 23), duration: number.sample,description: Faker::TvShows::SiliconValley.motto , title: Faker::ChuckNorris.fact, price: rand(1..999), location: Faker::Address.city, admin: User.all.sample)
end
2.times do 

attendance = Attendance.create(stripe_customer_id: "12223", user: User.all.sample, event: Event.all.sample)

end
puts "BDD créée"