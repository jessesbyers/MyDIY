class SessionsController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.find_by(name: params[:user][:username])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end
    
    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
