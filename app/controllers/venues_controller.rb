class VenuesController < ApplicationController
    def index
        @venues = Venue.all
    end

    def show
        @venue = Venue.find(params[:id])
        @users = User.all
    end

    def new
        @venue = Venue.new
    end

    def create
        @venue = Venue.new(venue_params)
        @venue.owner = current_user
        @venue.video.attach(venue_params[:video])
        @venue.thumbnail.attach(venue_params[:thumbnail])
        @venue.images.attach(venue_params[:images])


        if @venue.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    private
    def venue_params
        params.require(:venue).permit(:name, :description, :zip_code, :address, :city, :video, :thumbnail, images: [])
    end

end
