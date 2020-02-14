class SessionsController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(username: params[:user][:username])

        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to root_path
        else
            redirect_to login_path, alert: "Username and Password combination is not valid. Please try again."
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
