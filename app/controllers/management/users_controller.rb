class Management::UsersController < ManagementController
    before_action :set_user,only:[:show,:destroy]

    
    def index
        @users = User.all
        @users = @users.where(email: params[:email]) if params[:email].present?
        @users = @users.where(name: params[:name]) if params[:name].present?
        @users = @users.where(birthday: params[:birthday]) if params[:birthday].present?
    end
    
    def show
    end
    
    def destroy
        @user.destroy
        flash[:notice] = "削除しました。"
        redirect_to management_users_path
    end
    
    private
    
    def set_user
        @user = User.find(params[:id])
    end
    
    
    def set_params
        params.require(:user).permit(:email,:name,:point,:birthday,:address,:male)
    end
end