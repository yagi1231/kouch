class Info < ApplicationRecord
  VALID_PHONE_NUMBER_REGEX = /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  VALID_ADDRESS_REGER = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  validates :name, { presence: true }
  validates :address,  presence: true, format: { with: VALID_ADDRESS_REGER }
  validates :telnum,  presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }

  mount_uploader :image, ImageUploader
end