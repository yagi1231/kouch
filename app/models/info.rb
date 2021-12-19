class Info < ApplicationRecord
  VALID_PHONE_NUMBER_REGEX = /\A0[5789]0[-]?\d{4}[-]?\d{4}\z/
  VALID_ADDRESS_REGER = /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/
  VALID_NAME_REGER = /\p{Katakana}/
  validates :name, presence: true, format: { with: VALID_NAME_REGER }
  validates :address,  presence: true, format: { with: VALID_ADDRESS_REGER }
  validates :telnum,  presence: true, format: { with: VALID_PHONE_NUMBER_REGEX }

  mount_uploader :image, ImageUploader
end