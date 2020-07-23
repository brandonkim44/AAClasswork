class Api::SessionsController < ApplicationController
    # before_action :ensure_logged_in, only: [:destroy]

    def create
        @user = User.find_by_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user
            login!(@user)
        else
            render json: @user.errors.full_messages, status: 401
        end
    end

    def destroy
        if current_user
            logout!
            render json: {}
        else
            render json: {errors: "No user logged in", status: 404}, status: 404
            # render :json => {:error => "not-found"}.to_json, :status => 404
            # render(json: { :errors => something }, status: 404)  
        end
    end
end

# data: {user: {username: "brandon1234", password: "password123"}}