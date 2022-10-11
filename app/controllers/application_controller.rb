class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in
    before_action :require_login

    def logged_in
        session[:id] 
    end    

    def require_login
        if !logged_in?
        redirect_to login
    end

    def current_user
        @current_user ||= User.find(session[:id]) if 
        session[:id]
    end
end
