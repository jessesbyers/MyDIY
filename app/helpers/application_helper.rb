module ApplicationHelper
    
    def current_user(session)
        User.find(session[:user_id])
    end

    def logged_in?(session)
        !!session[:user_id]
    end

end
