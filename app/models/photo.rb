class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_one :annotation, dependent: :destroy

  scope :order_by_created_at, -> { order('created_at DESC') }
end
