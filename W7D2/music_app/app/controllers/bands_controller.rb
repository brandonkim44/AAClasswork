class BandsController < ApplicationController
    def index
        @bands = Band.all
        render :index
    end

    def show
        @band = Band.find_by(id: params[:id])
        render :show
    end

    def new
        @band = Band.new
        render :new
    end

    def create 
        @band = Band.create(valid_params)
        
        if @band.save
            redirect_to band_url(@band)       
        else
            flash.now[:errors] = @band.errors.full_messages
            render :new
        end
    end

    def edit #you get :id (wildcard) and render
        @band = Band.find_by(id: params[:id])
        render :edit
    end

    def update
        @band = Band.find_by(id: params[:id])

        if @band.update(valid_params)
            redirect_to band_url(@band)
        else
            flash.now[:errors] = @band.errors.full_messages
            render :edit
        end
        
    end

    def destroy

    end

    private

    def valid_params
        params.require(:band).permit(:name)
    end
end