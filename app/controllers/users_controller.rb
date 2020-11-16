class UsersController < ApplicationController
    
    def new
        @user = User.new
        
    end

    def create
        @user = User.new(user_params)
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
        @user = User.find(params[:id])
        @user.destroy
        session.clear
        redirect_to decisions_path
    end 

    private

    def user_params
        params.require(:user).permit(:username, :password, :city, :group)
    end

end
