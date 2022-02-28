class Event < ApplicationRecord
  belongs_to :user
  has_many :participations
  has_many :guests, through: :participations, source: :user
  has_many :event_creations
  has_many :creations, through: :event_creations
end
