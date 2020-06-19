class CatsController < ApplicationController
    def index
        @cats = Cat.new(cats_params)
    end

    def show
        @cat = Cat.find_by(id: params[:id])

        if @cat 
            render :show
        else
            render json: @cat.errors.full_messages, status: 422
        end
    end


    private 
    def cats_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end
end

