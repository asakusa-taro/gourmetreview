class ShopImage < ApplicationRecord
  belongs_to :shop
  mount_uploader :image, ImageUploader
  # validates :image, presence: true, length: { maximum: 50 }
end
