class ApplicationController < ActionController::Base

    def login_required
        if !logged_in?(session)
            redirect_to login_path
        end
    end

    def logged_in?(session)
        !!session[:user_id]
    end

end
