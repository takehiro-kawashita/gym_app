class ReservationsController < UserController
    
    def index
        @reservations = current_user.reservations
    end
    
    def show
        
    end
    
    def create
        @reservation = Reservation.new(user_id: current_user.id,lesson_id: params[:lesson_id])
        @lesson = @reservation.lesson
        @user = current_user
        if @reservation.save
            flash[:notice] = "予約完了"
            ReservationsMailer.send_confirm_to_user(@user).deliver
            redirect_to lesson_path(params[:lesson_id])
        else
            flash[:alert] = "予約失敗"
            render "lessons/show"
        end
    end
    
    def destroy
        reservation = Reservation.where(user_id: current_user.id,lesson_id: params[:id]).first
        reservation.destroy
        redirect_to reservations_path
        # redirect_to lesson_path(params[:lesson_id])
    end
end