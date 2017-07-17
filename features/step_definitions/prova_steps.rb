World(MultiTest::MinitestWorld)
World(Rack::Test::Methods)
When(/^I go to the homepage$/) do
  visit root_path
  @user = User.new(name: ' Michael Example', email: 'michael@example.com',
  password_digest: User.digest('password'),
  admin: true,
  activated: true,
  activated_at:  Time.zone.now )
  @user.save
end

Then(/^I should see the welcome message$/) do
  expect(page).to have_content("Welcome to the Recipely!")
   visit  user_path(@user)
    expect(page).to have_content("Welcome to the kitchen of  "+@user.name)
	expect(page).to have_content( @user.recipes.count.to_s)
   
    @user.recipes.paginate(page: 1).each do |recipe|
		expect(page).to have_content(recipe.titile.to_s)
    end

end

