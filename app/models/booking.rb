class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
  has_one :review

  validates :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(Pending Declined Accepted) }
end
