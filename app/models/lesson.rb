class Lesson < ApplicationRecord
    include Discard::Model
    default_scope -> { kept }
    has_many :reservations
    has_many :users,through: :reservations
    has_one_attached :image

    validates :title,presence: true,length: {maximum: 20}
    validates :level,presence: true
    validates :category,presence: true
    validates :started_at,presence: true
    validates :description,presence: true
    validates :price,presence: true
    validates :instructor,presence: true
    validates :limits,presence: true
    
end
