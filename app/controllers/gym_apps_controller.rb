class GymAppsController < ApplicationController
  
  def index
    
    @user_reservations = current_user.reservations
  end

  def create
    @gym_app.user_id = current_user.id
    @result = @gym_app.save
  end
  
  def show
  end
end
