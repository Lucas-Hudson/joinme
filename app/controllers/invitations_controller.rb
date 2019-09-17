class InvitationsController < ApplicationController
    before_action
    def index
        @invitations = Invitation.all
        @current_events_as_admin = current_user.current_events_as_admin
        @past_events_as_admin = current_user.past_events_as_admin
        @friends = current_user.friends

     #On marque la notif comme read si le user arrive sur la index page depuis une notif
     if params[:notif]
        InvitationNotification.find(params[:notif]).update(is_read?: true) 
      end
    end

    def show
        @invitation = Invitation.find(params[:id])
    end

    def new
        @invitation = Invitation.find(params[:format])
        @friends_to_invite = current_user.friends - current_user.sent_friend_requests - @invitation.guests
    end

    def create
        @venue = Venue.find(params[:venue_id])
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
