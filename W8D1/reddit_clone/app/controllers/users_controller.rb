class UsersController < ApplicationController

    before_action :ensure_logged_in, only: [:destroy, :show]
    
    # def index
    #     @users = User.all
    #     render :index
    # end

    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create
        @user = User.create(user_params)

        if @user.save
            login_user!(@user)
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])

        if @user.destroy
            redirect_to new_session_url
        else
            flash[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end
end
