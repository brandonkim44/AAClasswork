class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in? #allows us to use @current_user instance variable in our inherited controllers
    #how do I know which ones to have as helper methods? helper_method gives access in our views

    def current_user #to know what user is the current user, we'd look for matching session_token in our database
        @current_user ||= User.find_by(session_token: session[:session_token])  #User has a session_token that you can query
        #session[] is stored on client-side and is available to us..how? Is is just sent to us by browser?
    end

    def logged_in?
        !!current_user #if current_user exists, returns true, if current_user is nil, returns false (converts truthy/falsey to boolean values)
    end

    def log_in_user!(user) #takes user as an argument
        session[:session_token] = user.reset_session_token! #we use reset_session_token! here too make sure any
        #old session token is updated (even though it technically generates a new one when we create user)
    end

end
