class ApplicationController < ActionController::Base
    
    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
    end

    def login!(user)
        @current_user = user
        session[:session_token] = user.reset_session_token!
    end

    def logged_in?
        !!current_user
    end

    # def ensure_logged_in
    #     redirect_to api_session_url unless logged_in? 
    # end
end
