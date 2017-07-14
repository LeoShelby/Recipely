# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)

5.times do |n|
  name  =Faker::Simpsons.character
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
              email: email,
              password:              password,
              password_confirmation: password,
              activated: true,
              activated_at: Time.zone.now)
end
#Recipe
users = User.order(:created_at).take(6)
4.times do
  content = Faker::ChuckNorris.fact
  title= Faker::Food.dish
  rate=rand(1..5)
  time=rand(1..50)
  category=["primo","secondo","contorno","dessert"][rand(0..3)]
  
  users.each { |user| user.recipes.create!(content: content, title: title, category: category, rate: rate,time: time ) }
end


# Following relationships
users = User.all
user = users.first
following = users[2..5]
followers = users[3..5]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

User.create!(name:  "Angelo",
             email: "angelo@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             
             activated: true,
             activated_at: Time.zone.now)
