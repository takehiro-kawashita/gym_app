class UserController < ApplicationController
  before_action :authenticate_user!
#   before_action :set_user

  
    def create
        if @user.save #ユーザーのインスタンスが新しく生成されて保存されたら
          NotificationMailer.send_when_signup(@user).deliver #確認メールを送信
          redirect_to @user
        else
          render 'new'
        end
    end
    
    # private
    
    # def set_user
    #     @user = User.find(params[:id])
    # end
end
