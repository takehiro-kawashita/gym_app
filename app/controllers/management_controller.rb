class ManagementController < ApplicationController
    layout 'management'
    before_action :login

    def login
      unless session[:auth]
        redirect_to management_authenticate_path
      end
    end
end