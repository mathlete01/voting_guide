class SessionsController < ApplicationController

    def new

    end

    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            flash[:success] = "Welcome back, #{@user.username}"
            redirect_to decisions_path
        else
            flash[:danger] = "Incorrect credentials provided"
            redirect_to login_path
        end
    end

    def destroy
        session.clear
        redirect_to decisions_path
    end

end
