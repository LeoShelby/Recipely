# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


full_list=['Molluscs','Lupin','Mustard','Crustaceans', 'Eggs ', 'Fish','Peanuts','Soybeans','Milk','Nuts','Celery']
ingredient_list = ['Lupin','imustard','Molluscs','beans','cherry','orange','lemon','water','apple','banana','egg','milk','tomato','oil','sugar','pepper','butter','onion','garlic','potato','salt','pasta','meat','salad']
# UTENTI
User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin:     true,
             activated: true,
             activated_at: Time.zone.now)




6.times do |n|
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


#Recipe + user allergen
users = User.order(:created_at).take(6)



j=0

#lasciare mi serve per i test
ing_def=Ingredient.create!(name: 'pork')

users.each do |u|
	
	4.times do |n|

		content = Faker::ChuckNorris.fact
		title= Faker::Food.dish
		rate=rand(1..5)
		time=rand(1..50)
		category=["primo","secondo","contorno","dessert"][rand(0..3)]

		rec=u.recipes.create!(content: content, title: title, category: category, rate: rate,time: time )
		u.allergens.create!(type_allergen: full_list[rand(0..10)])
		
		i=Ingredient.create!(name: ingredient_list[j])
		j=j+1
		rec.nutrients.create(ingredient_id: i.id,measure: n )
		rec.nutrients.create(ingredient_id: ing_def.id,measure: n )
	end
end



# Following relationships
users = User.all
user = users.first
following = users[2..5]
followers = users[3..5]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


