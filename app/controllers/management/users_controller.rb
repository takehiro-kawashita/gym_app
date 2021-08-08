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
        @user = User.includes([:lessons]).find(params[:id])
    end
    
    def edit
    end
    
    def update
        user_params = set_params
        if @user.update(user_params)
            flash[:notice] = "Item was successfully updated."
            redirect_to management_user_path(@user)
        else
            flash[:alert] = "Item was unsuccessfully updated."
            render :edit
        end
    end

    def destroy
        @user.destroy
        flash[:notice] = "Item was successfully destroyed."
        redirect_to management_users_path
    end
    
    private

    def set_user
        @user = User.find(params[:id])
    end

    def set_params
        params.require(:user).permit(:email,:name,:point,:birthday,:address,:sex)
    end
end