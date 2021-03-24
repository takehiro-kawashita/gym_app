class Management::UsersController < ManagementController
    before_action :set_user,only:[:show,:point,:destroy]
    before_action :set_q,only: [ :index,:search]
    
    def index
        @users = User.all
        # @users = @users.where(email: params[:email]) if params[:email].present?
        # @users = @users.where(name: params[:name]) if params[:name].present?
        # @users = @users.where(birthday: params[:birthday]) if params[:birthday].present?
    end
    
    def point
        @user.point += params[:point].to_i
        @user.save
        redirect_to management_user_path(params[:id])
        
    end
    
    def show
    end
    
    def destroy
        @user.destroy
        flash[:notice] = "削除しました。"
        redirect_to management_users_path
    end
    
    def search
        @results = @q.result
    end
    
    private
    
    def set_q
        @q = User.ransack(params[:q])
    end

    def set_user
        @user = User.find(params[:id])
    end

    def set_params
        params.require(:user).permit(:email,:name,:point,:birthday,:address,:male)
    end
    
    
end