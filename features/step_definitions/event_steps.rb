
Then(/^I want to create an event$/) do
	visit root_url
	save_and_open_page
	click_link "new event"
	fill_in "Title", :with =>"pasta"
	fill_in "Content", :with =>"boil water..."
	fill_in "event_location", :with =>"rome"
	fill_in "event_data_ev", :with =>"23/8/2022"
	click_button "Post"
	click_button "Add Menu"
	click_link "Finish"

end
