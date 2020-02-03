class ApplicationController < ActionController::Base

    private

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end


    def logged_in?(session)
        !!session[:user_id]
    end
    
    def current_user(session)
        User.find(session[:user_id])
    end
  
    def redirect_already_logged_in
        if logged_in?(session)
          redirect_to root_path
        end
    end
  
    def redirect_not_logged_in
        if !logged_in?(session)
          redirect_to login_path
        end
    end
  
    #   def redirect_not_current_user
    #     if !logged_in?(session) || !@sighting.user_id == current_user(session).id
    #       redirect '/'
    #     end
    #   end
end
