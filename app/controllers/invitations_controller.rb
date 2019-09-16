class InvitationsController < ApplicationController
    before_action
    def index
        @invitations = Invitation.all
        @current_events_as_admin = current_user.current_events_as_admin
        @past_events_as_admin = current_user.past_events_as_admin
        @friends = current_user.friends
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

        @invitation = Invitation.new(admin_id: current_user.id, venue_id: @venue.id, start_date: Date.today)
        if @invitation.save
            redirect_to invitations_path
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
            redirect_to invitations_path
            flash[:success] = "L'invitation est supprimée"
        end
   end
end
