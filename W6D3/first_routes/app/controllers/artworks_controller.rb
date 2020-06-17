class ArtworksController < ApplicationController
    def index
        @artworks = Artwork.all
        render json: @artworks
    end
    
    def show
        @artwork = Artwork.find_by(id: params[:id])
        render json: @artwork
    end
    # params.require(:superhero).permit(:name, :secret_identity, :power)
    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save 
            redirect_to artworks_url
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def update
        @artwork = Artwork.find_by(id: params[:id])
        
        if @artwork.update
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id])

        if @artwork.destroy
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end 

    private

    def artwork_params
        params.require(:artwork).permit(:title, :artist_id, :image_url)
    end
end