class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :lesson
    
    validates :user_id,presence: true
    validates :lesson_id,presence: true
end
