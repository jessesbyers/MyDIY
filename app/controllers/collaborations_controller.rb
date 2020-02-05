class CollaborationsController < ApplicationController
    before_action :login_required

    def new
        @collaboration = Collaboration.new
    end

    def create
        raise params.inspect
    end

    def edit
    end

    def update
    end

    private
    
    def collaborations_params
    end

end