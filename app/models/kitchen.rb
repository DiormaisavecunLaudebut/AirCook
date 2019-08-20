class Kitchen < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  validates :location, :name, :price, :description, presence: true
end
