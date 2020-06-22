class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logged_in?
    !!current_user
  end

  def ensure_logged_in #user cannot sign/signup if logged in, and user can only create cats when logged in
    redirect_to cats_url if logged_in?
  end

  def ensure_logged_in_to_create_cats
    redirect_to cats_url unless logged_in?
  end
  
end
