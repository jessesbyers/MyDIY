class SessionsController < ApplicationController
    # before_action :require_login
    # skip_before_action :require_login, only: [:index]

    def new
    end
    
    def create
        @user = User.find_by(username: params[:username])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
    end

    def destroy
        binding.pry
        session.delete :user_id
        # redirect_to login_path
        redirect_to root_path

    end

    private

    # def user_params
    #     params.require(:user).permit(:username, :password)
    # end
end
