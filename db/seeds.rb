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

cities = ["Birmingham", "Machester", "Paris", "London", "Berlin", "Rome", "Amsterdam",
"Miami", "San Francisco", "Tokyo", "Helsinki", "Bern", "Kyiv", "Rio de Janeiro", "Stuttgart", "Budapest",
"Cape Town", "Beijing", "Sydney", "Belfast"]

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

User.create!(username: "Mindmaze", password: "password", email: "Mindmaze@Mindmaze.com", age: 36, city: "London")

categories = ["Sports", "Social", "Creative", "Music"]
users = User.all.sample


puts "Seeding activities..."

categories.each do |category|
  if category == "Sports"
    Activity.create!(name: "Football", image_url: "https://images.unsplash.com/photo-1553778263-73a83bab9b0c?q=80&w=3271&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Join in a game of football together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Basketball", image_url: "https://images.unsplash.com/photo-1546519638-68e109498ffc?q=80&w=2990&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Join in a game of basketball together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Rock Climbing", image_url: "https://plus.unsplash.com/premium_photo-1672281090478-9b3ad329ad88?q=80&w=3205&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Go indoor or outdoor climbing totether", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Live sporting event", image_url: "https://images.unsplash.com/photo-1489944440615-453fc2b6a9a9?q=80&w=3123&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Go and see your favourite team", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Archery", image_url: "https://plus.unsplash.com/premium_photo-1718315735010-a382235a28b7?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Shoot some targets together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Swimming", image_url: "https://images.unsplash.com/photo-1711653740774-26f6c9d5a147?q=80&w=3131&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Go for a swim or try wild swimming with a friend", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Tennis", image_url: "https://plus.unsplash.com/premium_photo-1666913667082-c1fecc45275d?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Play 1 versus 1 tennis", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
  elsif category == "Social"
    Activity.create!(name: "Go for a drink", image_url: "https://images.unsplash.com/photo-1627935649531-e6cd9819c739?q=80&w=3273&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Enjoy a drink together at a local bar or pub", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Go for a meal", image_url: "https://images.unsplash.com/photo-1574966739987-65e38db0f7ce?q=80&w=3271&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Enjoy eating out together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Stand up comedy", image_url: "https://images.unsplash.com/photo-1527261834078-9b37d35a4a32?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Go and see your favourite comedia together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Museum or Art Gallery", image_url: "https://images.unsplash.com/photo-1572953109213-3be62398eb95?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Go to a local museum or art galley together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
  elsif category == "Creative"
    Activity.create!(name: "Life Drawing", image_url: "https://images.unsplash.com/photo-1598714479411-a11ad65f7b2d?q=80&w=3096&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Attend a life drawing class together.", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Pottery Class", image_url: "https://images.unsplash.com/photo-1607556671927-78a6605e290b?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Attend a pottery class tohether", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Crafts", image_url: "https://images.unsplash.com/photo-1638829154930-9b47ff9cb533?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Do some crafting together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Learn to Cook", image_url: "https://images.unsplash.com/photo-1653233797467-1a528819fd4f?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Learn to cook or take a cooking class together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Paint Together", image_url: "https://images.unsplash.com/photo-1578961140619-896df05b1fd2?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Paint or attend a pianting class together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
  elsif category == "Music"
    Activity.create!(name: "Live music", image_url: "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?q=80&w=3270&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Go and watch some live music together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Play an instrument together", image_url: "https://images.unsplash.com/photo-1481886756534-97af88ccb438?q=80&w=3132&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "play an instrument together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Learn to play an instrument", image_url:"https://images.unsplash.com/photo-1665065291812-78cab838f1a0?q=80&w=3008&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Learn to play a new instrument together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
    Activity.create!(name: "Go to a music festival", image_url: "https://images.unsplash.com/photo-1472653816316-3ad6f10a6592?q=80&w=2740&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", description: "Go to a music festival together", location: cities[rand(0..cities.length)], user: users, category: category, location: cities.sample)
  end
end
puts "Created #{Activity.count} activities and #{User.count} users"
