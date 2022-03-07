class Event < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :guests, through: :participations, source: :user
  has_many :event_creations, dependent: :destroy
  has_many :creations, through: :event_creations
  has_one_attached :photo
end
