class Item < ApplicationRecord
    has_one_attached :image
    
    validates :name,presence: true
    validates :price,presence: true
    validates :stock,presence: true
    validates :description,presence: true
end
