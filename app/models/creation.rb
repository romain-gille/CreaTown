class Creation < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :fans, through: :likes, source: :user
  has_many :event_creations, dependent: :destroy
  has_many :events, through: :event_creations
  has_many_attached :photos
end
