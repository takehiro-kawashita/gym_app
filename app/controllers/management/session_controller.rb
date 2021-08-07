class Management::SessionController < ManagementController
    before_action :login,except: [:new,:create]
    
    def new
    end
    
    def create
        if params[:code] == Rails.application.credentials.code
            session[:auth] = true
            redirect_to management_lessons_path
        else
            session[:auth] = false
            flash.now[:alert] = "The authorization code is different."
            render :new
        end
    end
    
    def destroy
        session[:auth] = false
        redirect_to management_authenticate_path
    end
end