class UsersController < ApplicationController
    before_action :ensure_logged_in

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.create(valid_params)
        if @user.save
            login_user!(@user)
            redirect_to cats_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def valid_params
        params.require(:user).permit(:username, :password)
    end
end