class ApplicationController < ActionController::Base
    include Devise::Controllers::Helpers  #Nous permet d'accéder depuis le controller aux variables devise (current_user)

end
