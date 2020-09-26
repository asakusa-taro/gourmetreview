class Shop < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_many :reviews
  has_many :users, through: :reviews
  has_many :shop_images
  validates :name, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 50 }
  validates :business_hours, presence: true, length: { maximum: 50 }
  validates :address, presence: true, length: { maximum: 50 }
end
