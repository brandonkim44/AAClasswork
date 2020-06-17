class UsersController < ApplicationController
    
    def index
        @users = User.all
        render json: @users
    end
    
    def show
        @user = User.find_by(id: params[:id])
        render json: @user
    end
    # params.require(:superhero).permit(:name, :secret_identity, :power)
    def create
        @user = User.new(user_params)
        if @user.save 
            redirect_to users_url
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        
        if @user.update
            redirect_to user_url(@user)
        else
            render json: @user.errors.full_messages, status: 422
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])

        if @user.destroy
            redirect_to users_url
        else
            render json: @user.errors.full_messages, status: 422
        end
    end 

    def user_params
        params.require(:user).permit(:name, :email, :favorite_food)
    end
end