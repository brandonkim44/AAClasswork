class SessionsController < ApplicationController
    before_action :ensure_logged_in, except: [:destroy]

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])

        if user
            login_user!(user)
            redirect_to cats_url
        else
            flash.now[:errors] = ['Invalid Credentials']
            render :new
        end
    end

    def destroy
        current_user.reset_session_token! if current_user
        session[:session_token] = nil
        redirect_to new_session_url
    end
end