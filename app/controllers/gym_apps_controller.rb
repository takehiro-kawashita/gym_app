class GymAppsController < ApplicationController
  
  def index
    
    @user_reservations = User.all
  end

  def create
    @gym_app.user_id = current_user.id
    @result = @gym_app.save
  end
  
  def show
  end
end
