class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :logged_in?

    def current_user
        @user_who_is_current ||= User.find_by_id(session[:user_id]) if session
        @user_who_is_current
    end

    def logged_in?
        puts "logged in!"
        !!current_user
    end

end
