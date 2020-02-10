class SessionsController < ApplicationController
    
    def create
        @user = User.find_by(username: params[:username])

        if @user
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to login_path, alert: "User not found. Please try again."
        end
    end

    def omniauth
        @user = User.find_or_create_by(uid: auth[:uid]) do |u|
            u.username = auth[:info][:name]
            u.email = auth[:info][:email]
            u.password = SecureRandom.hex
        end

        session[:user_id] = @user.id
        redirect_to root_path
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private 

    def auth
      request.env['omniauth.auth']
    end
end
