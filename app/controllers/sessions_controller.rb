class SessionsController < ApplicationController

    def new
    end
    
    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
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
