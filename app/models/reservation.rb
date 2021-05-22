class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :lesson
    
    validates :user_id,presence: true,uniqueness: { scope: :lesson }
    validates :lesson_id,presence: true
    validate :lesson_full_member_valid?,if: :lesson_id?
    validate :lesson_reservation_limit,if: :lesson_id?
    
    private
    
    def lesson_full_member_valid?
        if self.lesson.limits <= self.lesson.reservations.count then
            errors.add(:base,'このレッスンの予約は満員です')
        end
    end
    
    def lesson_reservation_limit
        if self.lesson.started_at - 1.day <  Time.zone.now
            errors.add(:base,'このレッスンの予約は終了しました')
        end
    end
end
