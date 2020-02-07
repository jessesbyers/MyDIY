module LoginHelper

        def user_signup
            fill_in 'user_email', with: 'test1'
            fill_in 'user_username', with: 'test2'
            fill_in 'user_password', with: 'test300'
            fill_in 'user_password_confirmation', with: 'test300'
          click_button('Sign Up')
        end
      
        def user_login
            fill_in 'user_username', with: 'test2'
            fill_in 'user_password', with: 'test300'
          click_button('Log In')
        end
end