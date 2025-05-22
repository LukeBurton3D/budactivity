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

cities = ["Birmingham", "Machester", "Liverpool", "London", "Stoke on Trent", "Bradford", "Nottigham",
  "Bristol", "Leicester", "Sheffield", "York", "Portsmouth", "Newcastle", "Oxford", "Brighton", "Exeter",
"Bath", "St Albans", "Reading", "Worchester"]

puts "Seeding users..."
30.times do
  User.create!(
    username: Faker::Internet.unique.username,
    password: "password",
    email: Faker::Internet.unique.email,
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
      Activity.create!(name: Faker::Sport.sport, location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)    end
  elsif category == "Social"
    10.times do
      Activity.create!(name: Faker::Hobby.activity, location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)    end
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

# require 'faker'
# require 'open-uri'
# require 'json'

# puts "Cleaning DB..."
# Activity.destroy_all
# User.destroy_all
# ==================== CREATE USER ================================================
# UNPLASH_ACCESS_KEY = "2LjoAfRwyZnqcAdHp2K-ZcYc1N6aRlxQiJasNKgJgSk"
# QUERY = "face"
# BASE_URL = "https://api.unsplash.com/search/photos?client_id=#{UNPLASH_ACCESS_KEY}&query=#{QUERY}"

# unsplash_users_serialized = URI.parse(BASE_URL).read
# link["results"]
# parsed_user = JSON.parse(unsplash_users_serialized)["results"]
# n_user = 10

# cities = ["Birmingham", "Machester", "Liverpool", "London", "Stoke on Trent", "Bradford", "Nottigham",
#   "Bristol", "Leicester", "Sheffield", "York", "Portsmouth", "Newcastle", "Oxford", "Brighton", "Exeter",
#   "Bath", "St Albans", "Reading", "Worchester"
# ]

# puts "Creating #{n_user} users"
# parsed_user.each do |usr|
#   users_data = usr["user"]
#   photo_url = usr["urls"]
#   user = User.create!(
#     username: users_data["username"],
#     image_url: photo_url["regular"],
#     description: users_data["bio"],
#     city: users_data["location"] || cities[rand(0..cities.length)],
#     email: Faker::Internet.unique.email,
#     password: "password",
#     age: rand(18..99)
#   )

#   puts "Created user: #{user.username}"
# end

# puts "Created #{User.count} users"
# User.all.each do |user|
#   puts "#{user.username} #{user.email} from #{user.city}"
# end

# ==================== CREATE ACTIVITEIS ================================================

# QUERY2 = "activity"
# BASE_URL2 = "https://api.unsplash.com/search/photos?client_id=#{UNPLASH_ACCESS_KEY}&query=#{QUERY2}&per_page=20"

# unsplash_activities_serialized = URI.parse(BASE_URL2).read
# parsed_activities = JSON.parse(unsplash_activities_serialized)["results"]
# n_activity = parsed_activities.size

# puts "Creating #{n_activity} activities"
# parsed_activities.each do |activity|
#   user = User.all.sample

#   activity = Activity.create!(
#     name: activity["description"] || "gateway",
#     description: activity["alt_description"] || "Let's explore together",
#     category: Faker::Hobby.activity,
#     image_url: activity["urls"]["regular"],
#     location: activity["user"]["location"] || Faker::Locations::Australia.location,
#     user: user
    # duration: rand(1..10)
  # )

#   puts "Created activity: #{activity.name} by #{user.username} "
#   sleep(0.3)
# end

# puts " #{User.count} USERS : #{Activity.count} ACTIVITIES "
# User.first(4).each do |user|
#   puts "#{user.username} #{activity.name} from #{user.city}"

# User.first(4).each do |user|
#   puts "#{user.username} from #{user.city} ==>"
#   user.activities.each do |activity|
#     puts "🧳 #{activity.category},  #{activity.name}"
#   end
# end
