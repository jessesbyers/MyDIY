require 'rails_helper'

module LoginHelper
    def user_signup
        visit '/'
        click_link("Sign Up")
        fill_in 'user_email', with: 'test1'
        fill_in 'user_username', with: 'test2'
        fill_in 'user_password', with: 'test300'
        fill_in 'user_password_confirmation', with: 'test300'
        click_button('Submit')
    end
  
    def user_login
        visit '/'
        click_link("Log In")
        fill_in 'username', with: 'test2'
        fill_in 'password', with: 'test300'
      click_button('Log In')
    end
end

include LoginHelper

feature 'Sign Up' do
    scenario 'able to sign up for an account and log in' do
        user_signup
        expect(page).to have_content("Home: test2's Projects")
        expect(page).to have_content('Goals')
    end
end


feature 'Add a Project' do
    scenario 'able to create a new project' do
        user_signup
        click_link "Create A New Project"
        fill_in 'project_address', with: 'test1'
        fill_in 'project_overview', with: 'test2'
        click_button('Create Project')
        expect(page).to have_content('test1')
        expect(page).to have_content('test2')
    end
end


feature 'Add a New Goal' do
    scenario 'able to add a new goal' do
        user_signup
        click_link "Create A New Project"
        fill_in 'project_address', with: 'test1'
        fill_in 'project_overview', with: 'test2'
        click_button('Create Project')
        click_link("Add a New Goal")
        select('test1', :from => 'goal_project_id')
        fill_in 'goal_title', with: 'test title'
        fill_in 'goal_description', with: 'test description'
        fill_in 'goal_budget', with: '5000'
        select('Not Started', :from => 'goal_status')

        click_button('Create Goal')

        expect(page).to have_content('test1')
        expect(page).to have_content('test title')
        expect(page).to have_content('test description')
        expect(page).to have_content('Estimated Budget: $5000')
        expect(page).to have_content('Status: Not Started')
    end
end


        # fill_in 'image_url', with: 'https://i.imgur.com/n4iyLTd.png'
        # fill_in 'image_caption', with: 'test caption'
        # select('Before Photo', :from => 'image_genre')

        # expect(page).to have_content('test caption')
        # expect(page).to have_content('Before Photo')
        # expect(page).to have_content('https://i.imgur.com/n4iyLTd.png')