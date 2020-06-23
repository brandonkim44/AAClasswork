class SessionsController < ApplicationController
    def new  #renders :new session to show rendered log-in page to accept data from user
        render :new
    end

    def create #actually logs the user in and creates a new session (logging in means session_tokens must match)
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        ) #after user enters data on form, the params now has nested keys of :email, and :password and we can use our method in UserModel
        
        if user #if the user exists, then log them in (set tokens to match), else render :new with flash error
            session[:session_token] = user.reset_session_token! #we use reset_session_token! here too make sure any old session token is updated (even though it technically generates a new one when we create user)
            redirect_to user_url(user) # User#show page
        else
            flash.now[:errors] = ['Invalid Login Credentials']
            render :new #renders new action by sending a new request
        end
    end

    def destroy #logs user out of session (session tokens shouldn't match)
        user.session_token = User.reset_session_token!
        session[:session_token] = nil
        redirect_to new_session_url #redirects to login page
    end

end