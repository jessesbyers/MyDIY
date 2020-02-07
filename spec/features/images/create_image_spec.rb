require 'rails_helper'

feature 'Sign Up' do
    scenario 'able to sign up for an account and log in' do
        visit '/'
        click_link("Sign Up")
        fill_in 'user_email', with: 'test1'
        fill_in 'user_username', with: 'test2'
        fill_in 'user_password', with: 'test300'
        fill_in 'user_password_confirmation', with: 'test300'
        click_button('Submit')

        expect(page).to have_content("Home: test2's Projects")
        expect(page).to have_content('Goals')
    end
end



feature 'Add a Project' do
    scenario 'able to create a new project' do
        visit '/'
        click_link("Create a New Project")
        fill_in 'project_address', with: 'test1'
        fill_in 'project_overview', with: 'test2'
        click_button('Create Project')
    end
end





feature 'Add an Image' do
    scenario 'able to create an image' do
        #1. go to goal_path
        # visit(goal_path(:id))
        visit 'goals/8'

        #2. click on "Add an Image for this Goal"

        click_link("Add an Image for this Goal")
        # click_link "Add an Image for this Goal"
        #3. fill in url and caption and select genre
        fill_in 'image_url', with: 'https://i.imgur.com/n4iyLTd.png'
        fill_in 'image_caption', with: 'test caption'
        select('Before Photo', :from => 'image_genre')

        #4. click on "Create Image" button
        click_button('Create Image')

        expect(page).to have_content('test caption')
        expect(page).to have_content('Before Photo')
        expect(page).to have_content('https://i.imgur.com/n4iyLTd.png')
    end
end