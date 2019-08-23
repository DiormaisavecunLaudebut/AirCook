class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :kitchen
  has_one :review

  validates :start_date, :end_date, presence: true
  validates :status, inclusion: { in: %w(Pending Declined Accepted) }

  def compute_price
    self.price = (((end_date - start_date).to_i + 1) * kitchen.price || 0) + 8
  end
end
