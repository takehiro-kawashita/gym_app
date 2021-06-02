class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # has_many :reservations
  
  has_many :reservations
  has_many :lessons,through: :reservations
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable,:confirmable
         
  def is_confirmation_period_expired?
    self.confirmation_period_expired?
  end
         
end
