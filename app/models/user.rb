class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :creations
  has_many :likes
  has_many :participations
  has_many :events
  has_many :events, through: :participations
  has_many :creations, through: :likes
end
