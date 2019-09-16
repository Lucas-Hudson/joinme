class InvitatonsController < ApplicationController
    before_action
    def index
        @invitations = Invitation.all
    end

    def show
        @invitation = Invitation.find(params[:id]) 
    end

    def new
        @invitation = Invitation.new
    end

    def create
        @venue = Venue.find(params[:venue_id])
        puts "#" *20
        puts current_user.id
        puts "#" * 20
        puts @venue.id
        puts "#" *20
        
        @invitation = Invitation.new(admin_id: current_user.id, venue_id: @venue.id)
        if @invitation.save
            #redirect_to invitatoin_index
        else
            render 'new'
        end
    end

    def edit
    end

    def update
    end

    def destroy
        @invitation = Invitation.find(params[:id])
        if @invitation.destroy
            redirect_to root_path
            flash[:success] = "L'invitation est supprimée" 
        end
   end
end
