# This will cause OmniAuth to short circuit so that you can set the auth responses by:
OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
  :info => {:email => 'prova@examle.com' , :name => 'prova' },
  :uid => '123545' 

}) 



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
	
end

And (/^I want to fill in my allergen list$/) do
	expect(page).to have_content("Add allergen")
	#save_and_open_page
	assert find_button "Add allergen"
	click_button "Add allergen"
	#save_and_open_page
	assert find_link "View my profile"
	click_link "View my profile"
	
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

When(/^I sign up with (Facebook|Google\+)$/) do |provider|
	
	assert find_link('Sign up now!')
	click_link 'Sign up now!'
	#save_and_open_page
	assert find_link('Sign up with '+provider)
	
	click_link 'Sign up with '+provider #ritorna al controller  le credenziali autohash come se fossi veramente acceduto a facebook con quelle
	
	
	
end
Then(/^I want to view my account$/) do
	#save_and_open_page
	assert find_link('Account')
	#assert find_link('following')
	assert find('.row').first(:link, "following") #row è la classe all internmo del quale cerco il link following per evitare collision
	assert find_link('follower')
	click_link 'Account'
	assert find_link('Profile')
	assert find_link('Settings')
	assert find_link('Log out')
	
end

Then(/^I want to view my profile$/) do

	assert find_link('following')	
	assert find_link('follower')
	expect(page).to have_content("My allergens are :")
	expect(page).to have_content("Welcome to the kitchen of ")
end


