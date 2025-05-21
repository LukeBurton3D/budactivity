# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts "Cleaning DB..."
Activity.destroy_all
User.destroy_all

cities = ["Birmingham", "Machester", "Liverpool", "London", "Stoke on Trent", "Bradford", "Nottigham",
  "Bristol", "Leicester", "Sheffield", "York", "Portsmouth", "Newcastle", "Oxford", "Brighton", "Exeter",
"Bath", "St Albans", "Reading", "Worchester"]

puts "Seeding users..."
30.times do
  User.create!(
    username: Faker::Internet.unique.username,
    password: "password",
    email: Faker::Internet.email,
    age: rand(18..80),
    city: cities[rand(0..cities.length)]
  )
end

categories = ["Sports", "Social", "Creative", "Music"]
users = User.all.sample


puts "Seeding activities..."

categories.each do |category|
  if category == "Sports"
    10.times do
      Activity.create!(name: Faker::Sport.sport, location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    end
  elsif category == "Social"
    10.times do
      Activity.create!(name: Faker::Hobby.activity, location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    end
  elsif category == "Creative"
    Activity.create!(name: "Life Drawing", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Pottery Class", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Crafts", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Learn to Cook", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Paint Together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
  elsif category == "Music"
    Activity.create!(name: "Live music", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Play an instrument together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Learn to play an instrument", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Go to a music festival", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
  end
end

puts "Created #{Activity.count} activities and #{User.count} users"
