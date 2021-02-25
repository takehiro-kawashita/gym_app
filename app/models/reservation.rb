class Reservation < ApplicationRecord
    belongs_to :user
    belongs_to :lesson
    
    validates :user_id,presence: true
    validates :lessons,presence: true
end
