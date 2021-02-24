class Reservation < ApplicationRecord
    belongs_to :user
    
    validates :user_id,presence: true
    validates :lessons,presence: true
end
