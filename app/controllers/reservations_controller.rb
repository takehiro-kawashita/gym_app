class ReservationsController < ApplicationController
    
    def index
        @reservation = Reservation.where(user_id: session[:user_id])   
    end
    
    def show
    end
    
    def create
           redirect_to reservation_path

    end
    
    def new
    end
end