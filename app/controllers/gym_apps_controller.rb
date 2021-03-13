class GymAppsController < ApplicationController
  
  before_action :authenticate_user!
  
  def index
    @user_reservations = User.where(user_id: session[:user_id])
  end

  def show
  end
end
