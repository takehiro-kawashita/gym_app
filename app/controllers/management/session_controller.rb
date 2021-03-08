class Management::SessionController < ApplicationController
    layout 'management'
    before_action :logout
    
    def new
    end
    
    def create
        if params[:code] == Rails.application.credentials.code
            session[:auth] = true
            redirect_to management_lessons_path
        else
            session[:auth] = false
            flash.now[:alert] = "認証コードが違います。"
            render :new
        end
    end
    
    def logout
        session[:auth] = false
        

    end
end