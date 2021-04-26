class ManagementController < ApplicationController
    layout 'management'
    before_action :login

    def login
      if session[:auth] == false
        redirect_to management_authenticate_path
      end
    end
end