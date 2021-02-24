class Lesson < ApplicationRecord
    belongs_to :reservation
    
    validates :title,presence: true
    validates :level,presence: true
    validates :category,presence: true
    validates :started_at,presence: true
    validates :description,presence: true
    validates :price,presence: true
    validates :instructor,presence: true
    validates :limits,presence: true
    
end
