class ReservationsController < ApplicationController
    
    def index
        @reservations = current_user.reservations
    end
    
    def create
        if Reservation.where(user_id: current_user.id,lesson_id: params[:lesson_id]).blank?
            Reservation.create(user_id: current_user.id,lesson_id: params[:lesson_id])
        end
        redirect_to lesson_path(params[:lesson_id])
    end
    
    def destroy
        reservation = Reservation.where(user_id: current_user.id,lesson_id: params[:lesson_id]).first
        reservation.destroy
        redirect_to lesson_path(params[:lesson_id])
    end
end