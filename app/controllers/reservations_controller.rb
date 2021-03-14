class ReservationsController < ApplicationController
    
    def index
    end
    
    def show
    end 
    
    def create
        reservation_params = params.require(:reservation).permit(:lesson_id)
        @reservation = Reservation.new(reservation_params)
        @reservation.save
        redirect_to reservations_path
    end
end