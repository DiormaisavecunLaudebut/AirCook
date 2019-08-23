class Review < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  validates :content, presence: true, length: { minimum: 20 }
end
