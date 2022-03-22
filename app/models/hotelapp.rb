class Hotelapp < ApplicationRecord
  belongs_to :user
  has_many :rents

  has_one_attached :room_image
end
