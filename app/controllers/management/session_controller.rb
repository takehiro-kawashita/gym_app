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
            flash.now[:alert] = "認証コードが違います。"
            render :new
        end
    end
    
    def destroy
        session[:auth] = false
        redirect_to management_authenticate_path
    end
end