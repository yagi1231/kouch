class Reservation < ApplicationRecord
  VALID_PHONE_NUMBER_REGEX = /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
<<<<<<< HEAD
  VALID_ADDRESS_REGER = /\A[0-9]|[-]|(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
=======
  VALID_ADDRESS_REGER =  /\A[0-9]|[-]|(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
>>>>>>> 511b2c1cfc03696fae904533942ecf039df0f8cc
  validates :name, { presence: true }
  validates :address,  presence: true, format: { with: VALID_ADDRESS_REGER }
  validates :telnum,  presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }
  validates :time, { presence: true }
  validates :backtime, { presence: true }
  validates :order, { presence: true }
  validates :price, { presence: true }
  validates :category, { presence: true }
  validates :categoryname, { presence: true }

  mount_uploader :image, ImageUploader
  has_many :likes
end
