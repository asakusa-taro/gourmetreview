class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                  uniqueness: { case_sensitive: false }
  has_secure_password
  has_many :shops
  has_many :favorites
  has_many :fav_shops, through: :favorites, source: :shop

  def favorite(shop)
    self.favorites.find_or_create_by(shop_id: shop.id)
  end
  
  def unfavorite(shop)
    favorite = self.favorites.find_by(shop_id: shop.id)
    favorite.destroy if favorite
  end
  
  def favoring?(shop)
    self.fav_shops.include?(shop)
  end

end
