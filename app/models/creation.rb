class Creation < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :event_creations
end
