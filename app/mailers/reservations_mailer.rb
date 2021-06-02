class ReservationsMailer < ApplicationMailer
    default from: "tkawashita1221@gmail.com"
    
    def send_confirm_to_user(user,reservation)
        @user = user
        @reservation = reservation
        mail(
            from: "SILVER'S GYM",
            subject: "レッスン予約が完了しました",
            to: @user.email
        )
    end
end
