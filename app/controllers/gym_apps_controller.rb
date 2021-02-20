class GymAppsController < ApplicationController
  
  def index
    @gym_app = current_user.lessons
  end

  def create
    # @gym_app.user_id = current_user.id
    # @result = @gym_app.save
  end
  
  def show
  end
end
