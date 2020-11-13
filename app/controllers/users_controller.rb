class UsersController < ApplicationController
    
    def new
        @user = User.new
        @city = City.first
    end

    def create
        #@city = City.first
        @user = User.new(user_params)
        @user.group = false
        @user.admin = false
        @user.name = ""
        @user.email = ""
        if @user.save
            @user.make_empty_decisions
            session[:user_id] = @user.id
            redirect_to decisions_path
        else
            flash[:danger] = "Looks like we've seen you before. Try signing in instead of signing up"
            redirect_to signup_path
        end
    end

    def destroy
        puts "*****************   users_controller/destroy called"
        @user = User.find(params[:id])
        @user.destroy
        session.clear
        redirect_to decisions_path
    end 

    private

    def user_params
        params.require(:user).permit(:username, :password, :city, :group)
        #params.require(:user).permit(:username, :password, :group => false)
    end

end
