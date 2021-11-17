class Info < ApplicationRecord
  validates :name, { presence: true }
  validates :address, { presence: true }
  validates :telnum, { presence: true }
end
