class Review < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  validates :review, presence: true, length: { maximum: 255 }

end
