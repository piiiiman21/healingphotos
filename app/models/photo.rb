class Photo < ApplicationRecord
  belongs_to :user
  has_many :favorite, dependent: :destroy
   mount_uploader :content, ContentUploader
   
  validates :title, presence: true, length: { maximum: 255 }
  validates :content, presence: true
end
