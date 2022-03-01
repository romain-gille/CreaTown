class Event < ApplicationRecord
  belongs_to :user
  has_many :participations, dependent: :destroy
  has_many :guests, through: :participations, source: :user
  has_many :event_creations, dependent: :destroy
  has_many :creations, through: :event_creations
end
