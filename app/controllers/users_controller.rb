class UsersController < ApplicationController

    attr_accessor :make_empty_decisions
    
    def new
        @user = User.new
        @city = City.first
    end

    

    def create
        #@city = City.first
        @user = User.new(user_params)
        @user.make_empty_decisions
        if @user.save
            session[:user_id] = @user.id
            redirect_to decisions_path
        else
            render :new
        end
    end

    private

    

    def user_params
        #params.require(:user).permit(:username, :password, :city)
        params.require(:user).permit(:username, :password)
    end

    
end
