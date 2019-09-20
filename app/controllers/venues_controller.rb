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
        @tags = Tag.all

        puts "N " * 50
        puts params[:calls_check]
        puts "N " * 50
    end

    def create

        @tags = Tag.all
        @venue = Venue.new(venue_params)
        @venue.owner = current_user
        @venue.video.attach(venue_params[:video])
        @venue.thumbnail.attach(venue_params[:thumbnail])
        @venue.images.attach(venue_params[:images])
        @venue.avatar.attach(venue_params[:avatar])


        if params[:food] != nil
          @venue.food = true
        else
          @venue.food = false
        end
        params[:tag_ids].each do |tag|
          JoinTagVenue.create(tag_id: tag, venue: @venue)
        end

        if @venue.save
            redirect_to root_path
        else
            render 'new'
        end

    end

    def edit
      @venue = Venue.find(params[:id])
    end

    def update
        @venue = Venue.find(params[:id])
        if @venue.update(venue_params)
          redirect_to venue_path(@venue)
        else
          render 'new'
        end
    end



    private
    def venue_params
        params.require(:venue).permit(:name, :description, :zip_code, :address, :city, :min_drink_price, :food, :video, :thumbnail, :avatar, images: [])
    end

end
