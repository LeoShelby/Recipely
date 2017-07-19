# This will cause OmniAuth to short circuit so that you can set the auth responses by:
OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
  :info => {:email => 'prova@examle.com' , :name => 'prova' },
  :uid => '123545' 

}) 

Given(/^I am authenticated$/) do
	@Auser = User.second
	@followed_user=@Auser.following.first
	@followed_user
	visit '/login'
	fill_in "Email", :with => @Auser.email
	fill_in "Password", :with => 'password'
	click_button "Log in"

end

Given(/^I am userB$/) do
	@userB=User.create!(name:  "UserB",
             email: "UserB@railstutorial.org",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)
	@userA=User.find_by(email: "example@railstutorial.org")
	@userC=User.find_by(email: "example-3@railstutorial.org")
	visit '/login'
	fill_in "Email", :with => @userB.email
	fill_in "Password", :with => 'password'
	click_button "Log in"
	

end

When(/^I am userA$/) do

	visit '/login'
	fill_in "Email", :with => @userA.email
	fill_in "Password", :with => 'foobar'
	click_button "Log in"
	

end

Then(/^I want to view UserA profile$/) do
	click_link 'Users'
	click_link @userA.name

end

Given(/^I am admin$/) do
	@admin = User.find_by(name: 'Example User')

	visit '/login'
	fill_in "Email", :with => @admin.email
	fill_in "Password", :with => 'foobar'
	click_button "Log in"

end

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

When(/^I visit the users index$/) do
	#save_and_open_page
	click_link 'Users'
	User.all.paginate(page: 1).each do |u|
		assert find('.users').first(:link,u.name)
		@Ulink=@Ulink||u.name 
    end
end

Then(/^I want to view a user profile$/) do

	find('.users').first(:link,@Ulink).click
	expect(page).to have_content("Recipes")
	expect(page).to have_content("My allergens are :")
end

Then(/^I want to un-follow a user$/) do
	if @followed_user
		find('.users').first(:link,@followed_user.name).click
		click_button 'Unfollow'
		click_button 'Follow'
	else
		find('.users').first(:link,@Ulink).click
		click_button 'Follow'
		click_button 'Unfollow'
	end
end

When(/^I visit the settings$/) do
	click_link 'Settings'
end

Then(/^I want to edit my profile$/) do

	fill_in "Name", :with => @Auser.name+"mod"
	click_button 'Save changes'
	expect(page).to have_content(@Auser.name+"mod")
	expect(page).to have_content("Profile updated")
	
end
Then(/^I want to logout$/) do
	click_link 'Log out'
	find_link('Log in')
end

Then(/^I want to delete a user$/) do
	
	find('.users').first(:link,'delete').click
	expect(page).to have_content("User deleted")
end

Then(/^I want to follow UserB$/) do
	@userB=User.create!(name:  "UserB",
             email: "UserB@railstutorial.org",
             password:              "password",
             password_confirmation: "password",
             activated: true,
             activated_at: Time.zone.now)
     @Auser.follow(@userB)


	
end

When(/^UserB authenticate$/) do
	visit '/login'
	fill_in "Email", :with => @userB.email
	fill_in "Password", :with => 'password'
	click_button "Log in"
end

Then(/^UserB recives a Follow notification$/) do
	click_link 'View All'
	expect(page).to have_content(@Auser.name+" started to follow you")
end


Then(/^UserA recives a Like notification$/) do
	click_link 'View All'
	expect(page).to have_content(@userB.name+" like your recipe")
	
end

Then(/^UserA recives a Done notification$/) do
	click_link 'View All'
	expect(page).to have_content(@userB.name+" done your recipe")
end



Then(/^I recive a creator badge notification$/) do
	click_link 'View All'
	expect(page).to have_content("You gain a new badge! Creator")
end

Then(/^I recive a liker badge notification$/) do
	click_link 'View All'
	expect(page).to have_content("You gain a new badge! Liker")
end


Then(/^I want to search a user$/) do
	fill_in "search", :with => User.second.name
	click_button 'Search User'
	
end

Then(/^I recive a chef badge notification$/) do
	click_link 'View All'
	expect(page).to have_content("You gain a new badge! Chef")
end


Then(/^I want to follow a user$/) do
	find('.users').first(:link,@userA.name).click
	click_button 'Follow'
end

Then(/^I recive a birdman badge notification$/) do
	click_link 'View All'
	expect(page).to have_content("You gain a new badge! Birdman")
end

Then(/^I recive a commenter badge notification$/) do
	click_link 'View All'
	expect(page).to have_content("You gain a new badge! Commenter")
end
When(/^I visit my profile$/) do
	
	visit root_url
	click_link 'view my profile'
end


Then(/^I want to view my badges$/) do
	click_link 'View My Badges'
	expect(page).to have_content("Your Badges")
	expect(page).to have_content("Liker")
end

Then(/^I want to view my chef lv2 badge$/) do
	click_link 'View My Badges'
	expect(page).to have_content("Your Badges")
	expect(page).to have_content("Chef Level 2")
end

Then(/^I want to view my liker lv2 badge$/) do
	click_link 'View My Badges'
	expect(page).to have_content("Your Badges")
	expect(page).to have_content("Liker Level 2")
end

Then(/^I want to view my creator lv2 badge$/) do
	click_link 'View My Badges'
	expect(page).to have_content("Your Badges")
	expect(page).to have_content("Creator Level 2")
end

Then(/^I want to follow 2 users$/) do
	click_link 'Users'
	#click_link @userA.name
	find('.users').first(:link,@userA.name).click
	click_button 'Follow'
	click_link 'Users'
	#click_link @userC.name
	find('.users').first(:link,@userC.name).click
	click_button 'Follow'
	visit root_url


end

Then(/^I want to view my birdman lv2 badge$/) do

	click_link 'View My Badges'
	expect(page).to have_content("Your Badges")
	expect(page).to have_content("Birdman Level 2")
end

Then(/^I want to view my commenter lv2 badge$/) do
	click_link 'View My Badges'
	expect(page).to have_content("Your Badges")
	expect(page).to have_content("Commenter Level 2")
end

Then(/^I want to view the event$/) do
	
	expect(page).to have_content("Created by")
	expect(page).to have_content("Description")
	expect(page).to have_content("Date")
	
end
