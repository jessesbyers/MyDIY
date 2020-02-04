class GoalsController < ApplicationController
     before_action :login_required

    def show
        @goal = Goal.find(params[:id])
    end
end