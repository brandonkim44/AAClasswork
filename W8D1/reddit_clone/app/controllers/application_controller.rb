class ApplicationController < ActionController::Base

    def logout_user
        current_user.reset_session_token!
        session[:session_token] = nil 
    end
    
    def login_user!(user)
        @current_user = user
        session[:session_token] = user.reset_session_token!
        redirect_to subs_url
    end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def ensure_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def logged_in?
        !!current_user
    end

    def is_moderator?
        @sub = Sub.find_by(id: params[:id])
        redirect_to sub_url(@sub) unless @sub.moderator == current_user.id
    end

    def is_author?
        @user = User.find_by(id: params[:id])
        redirect_to subs_url unless @user.id == current_user.id
    end

end
