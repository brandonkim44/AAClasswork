class SessionsController < ApplicationController

    before_action :ensure_logged_in, only: [:destroy]

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user
            login_user!(@user)
        else
            flash[:errors] = ["Invalid username or password!"]
            render :new
        end
    end


    def destroy
        logout_user
        redirect_to new_session_url
    end

end
