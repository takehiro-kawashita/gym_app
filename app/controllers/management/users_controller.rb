class Management::UsersController < ManagementController
    before_action :set_user,only:[:show,:edit,:point,:update,:destroy]
    # before_action :set_q,only: [ :index,:search]
    
    def index
        @q = User.ransack(params[:q])
        @users = @q.result(distinct: true).page(params[:page]).per(5)
    end
    
    def point
        @user.point += params[:point].to_i
        @user.save
        redirect_to management_user_path(params[:id])
    end
    
    
    
    def show
    end
    
    def edit
    end
    
    def update
        user_params = set_params
        if @user.update(user_params)
            flash[:notice] = "会員情報を更新しました。"
            redirect_to management_user_path(@user)
        else
            flash[:alert] = "会員情報の更新に失敗しました。"
            render :edit
        end
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