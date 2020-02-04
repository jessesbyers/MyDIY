module ApplicationHelper

    # helper methods to be used in views and controllers
    # memoize current_user

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

end
