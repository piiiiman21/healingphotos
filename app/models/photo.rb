class Photo < ApplicationRecord
  belongs_to :user
   mount_uploader :content, ContentUploader
   
  validates :title, presence: true, length: { maximum: 255 }
end
