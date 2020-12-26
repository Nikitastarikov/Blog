class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  validates :title, :summary, :body, presence: true
end
