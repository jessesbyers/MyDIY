class SessionsController < ApplicationController
    def new
    end
    
    def create
        @user = User.find_by(:username => params[:user][:username])
        session[:user_id] = @user.id
        redirect_to root_path
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
