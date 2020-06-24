class AlbumsController < ApplicationController
    #why no index in routes?
    
    def show
        @album = Album.find_by(id: params[:id])
        render :show
    end

    def new
        @album = Album.new
        render :new
    end

    def create
        @album = Album.find_by(id: params[:id])

        if @album
            @album.update(valid_params)
            redirect_to album_url(@album)
        else
            flash.now[:error] = @album.errors.full_messages
            render :new
        end
    end

    def edit
        @album = Album.find_by(id: params[:id])
        render :edit
    end

    def update
        @album = Album.find_by(id: params[:id])

        if @album.save
            redirect_to album_url(@album)
        else
            flash.now[:errors] = @album.errors.full_messages
            render :edit
        end
    end

    def destroy
        @album = Album.find_by(id: params[:id])

        if @album.destroy
            redirect_to bands_url
        else
            flash.now[:errors] = @album.errors.full_messages
            redirect_to bands_url
        end
    end

    private

    def valid_params
        params.require(:album).permit(:title, :band_id, :year, :sound)
    end
end