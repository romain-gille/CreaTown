class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :creations, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :events, dependent: :destroy
  has_many :attended_events, through: :participations, source: :event
  has_many :liked_creations, through: :likes, source: :creation
  has_one_attached :photo
end
