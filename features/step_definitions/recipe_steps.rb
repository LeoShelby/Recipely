When(/^I visit the recipes index$/) do
	
	visit root_url
	assert find_link("Recipes")
	click_link "Recipes"
end
Then(/^I want to view all the recipe$/) do
	
    Recipe.all.paginate(page: 1).each do |recipe|
    @link=recipe.title.to_s 
	expect(page).to have_content(recipe.title.to_s)
	
    end
end
And(/^I want to view the recipe decription$/) do

	find('.recipes').first(:link, @link).click
	expect(page).to have_content(@link.capitalize)
	expect(page).to have_content("Description")
	expect(page).to have_content("Difficulty")
	expect(page).to have_content("Time")
	expect(page).to have_content("Category")
	expect(page).to have_content("Ingredients")
end

When(/^I create a recipe$/) do
	
	visit root_url
	click_link "New Recipe!"
	fill_in "Title", :with =>"pasta"
	fill_in "Content", :with =>"boil water..."
	click_button "Post"
end
Then(/^I want to put ingredients$/) do
	fill_in "ingredient", :with =>"pasta"
	click_button "Add Ingredient"
	save_and_open_page
	click_link "add_allergen"

end

Then(/^I want to put allergens$/) do
	click_button "Add allergen"
	click_link "View my recipe"

end


When(/^I view a recipe$/) do
	
	visit root_url
	click_link "view my profile"
	assert find('.recipes').first(:link, @Auser.recipes.first.title).click

	
end
Then(/^I want to update a recipe$/) do
	click_link "update"
	fill_in "Title", :with =>"mod"
	click_button "Save changes"
	expect(page).to have_content("Recipe updated")
	
end
Then(/^I want to delete a recipe$/) do
	click_link "delete"
	expect(page).to have_content("Recipe deleted")
	
end

Then (/^I want to like UserA recipe$/) do
	find('.recipes').first(:link, @userA.recipes.first.title).click
	click_button 'Like!'
end

And(/^I want to view the ingredients info$/) do

	click_link 'pork'
	expect(page).to have_content("calories")
	expect(page).to have_content("cautions")

end

Then(/^I want to search a recipe by title$/) do
	fill_in "search", :with =>"blabla"
	click_button "Search Recipe"
	expect(page).to have_content("There are no Recipes")
	
end

Then(/^I want to comment the recipe$/) do
	fill_in "comment_content", :with =>"good recipe"
	click_button "Create Comment"
	expect(page).to have_content("good recipe")
	
end

Then(/^I want to like the recipe$/) do

	click_button "Like!"
	expect(page).to have_content("1 Like")
	find_button ("Unlike")
	
end

Then(/^I want to do the recipe$/) do

	click_button "Done it!"
	expect(page).to have_content("1 Doneit")
	find_button ("UnDone it")

end

Then(/^I want to do UserA recipe$/) do

	find('.recipes').first(:link, @userA.recipes.first.title).click
	click_button 'Done it!'
end
Then(/^I want to search a recipe by category$/) do
	
	click_link 'Advanced Search'
	save_and_open_page
	find("option[value='primo']").click
	click_button 'Search'
	expect(page).to have_content("All results")
	
end
Then(/^I want to search a recipe by difficulty$/) do
	
	click_link 'Advanced Search'
	find("option[value='1']").click
	
	click_button 'Search'
	expect(page).to have_content("All results")
	
end
Then(/^I want to search a recipe by extimated time$/) do
	
	click_link 'Advanced Search'
	fill_in 'search_time', :with =>30

	click_button 'Search'
	expect(page).to have_content("All results")
	
end
