class Reservation < ApplicationRecord
  validates :name, { presence: true }
  validates :address, { presence: true }
  validates :telnum, { presence: true }
  validates :time, { presence: true }
  validates :backtime, { presence: true }
  validates :order, { presence: true }
  validates :price, { presence: true }
  validates :category, { presence: true }
  validates :categoryname, { presence: true }

  has_many :likes
  mount_uploader :image, ImageUploader
end
