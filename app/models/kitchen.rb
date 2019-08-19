class Kitchen < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  validates :location, :name, :price, :description, presence: true
end
