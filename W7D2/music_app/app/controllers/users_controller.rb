class UsersController < ApplicationController
    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
        
        if @user
            render :show
        else
            flash.now[:errors] = @user.errors.full_messages #let's user know that it doesn't exist/invalid id
            render :new
        end
    end

    def create
        @user = User.create(valid_params)

        if @user.save 
            redirect_to bands_url #should log them in automatically, because @user now has matching session[:session_token] == self.session_token
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    private

    def valid_params
        params.require(:user).permit(:email, :password)
    end
end