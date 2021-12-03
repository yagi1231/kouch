class Info < ApplicationRecord
  validates :name, { presence: true }
  validates :address, { presence: true }
  validates :telnum, { presence: true }
  belongs_to :user
  mount_uploader :image, ImageUploader
end
