class User < ApplicationRecord
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
                    
    has_secure_password
    
    has_many :photos
    has_many :favorites
    has_many :likes, through: :favorites, source: :photo
    
    def favorite(other_photo)
      self.favorites.find_or_create_by(photo_id: other_photo.id)
    end

    def unfavorite(other_photo)
    favorite = self.favorites.find_by(photo_id: other_photo.id)
    favorite.destroy if favorite
    end

    def likes?(other_photo)
    self.likes.include?(other_photo)
    end
    
    
end
