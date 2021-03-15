class ReservationsController < ApplicationController
    
    def index
        @reservations = Reservation.all
    end
    
    def create
        @reservation = Reservation.where(user_id: :current_user,lesson_id: :lesson_id)
        redirect_to lesson_path
    end
    
    def destroy
    end
end