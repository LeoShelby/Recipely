

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
	
	assert find_link(@link)
	click_link @link
	expect(page).to have_content(@link.capitalize)
	expect(page).to have_content("Description")
	expect(page).to have_content("Difficulty")
	expect(page).to have_content("Time")
	expect(page).to have_content("Category")
	expect(page).to have_content("Ingredients")
end
