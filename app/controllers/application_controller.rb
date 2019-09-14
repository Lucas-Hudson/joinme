class ApplicationController < ActionController::Base
    include Devise::Controllers::Helpers  #Nous permet d'accéder depuis le controller aux variables devise (current_user)
    before_action :authenticate_user! #All pages are blocked and only signed in users can access it (except)
end
