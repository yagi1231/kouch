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

  # 以下の1行を追記
  has_many :likes
  belongs_to :user
  mount_uploader :image, ImageUploader
end
