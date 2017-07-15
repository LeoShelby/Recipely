Given(/^I am not registred$/) do
	@user = User.new(name: 'Marco Example', 
	email: 'marco@example.com',
	 password_digest: User.digest('password'),
	 activated: false)
	 assert  @user.valid?
end

When(/^I visit the homepage$/) do
	visit root_url
	expect(page).to have_content("Welcome to the Recipely!")
end

Then(/^I want to register with valid params$/) do
	
	visit '/signup'
	assert find_button("Create my account")
	fill_in "Name", :with => @user.name
    fill_in "Email", :with => 'aaa.it'
    fill_in "Password", :with => 'password'
	fill_in "Confirmation", :with => ''
	click_button "Create my account"
	expect(page).to have_content("error")
	fill_in "Email", :with => @user.email
	fill_in "Password", :with => 'password'
	fill_in "Confirmation", :with => 'password'
	click_button "Create my account"
	expect(page).to have_content("Welcome to the Recipely!")
end

Given(/^I am registred$/) do
	@user = User.new(name: 'Marco Example', 
	email: 'marco@example.com',
	password_digest: User.digest('password'),
	activated: true)
	assert @user.save
end

Then(/^I want to authenticate$/) do
	visit '/login'
	expect(page).to have_content("Log in")
	assert find_button("Log in")
	fill_in "Email", :with => @user.email
	fill_in "Password", :with => 'password'
	click_button "Log in"
	expect(page).to have_content("Welcome to the kitchen of "+@user.name)
end

When(/^I forget my password$/) do
	visit '/login'
	assert find_button("Log in")

end
Then(/^I want to retrieve it by email$/) do
	click_link "(password dimenticata)"
	expect(page).to have_content("Forgot password")
	assert find_button("Submit")
	fill_in "Email", :with => @user.email
	click_button "Submit"
	expect(page).to have_content("Email sent with password reset instructions")
	expect(page).to have_content("Email sent with password reset instructions")
end
