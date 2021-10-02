class Reservation < ApplicationRecord
    validates :name, {presence: true}
    validates :address, {presence: true}
    validates :telnum, {presence: true}
    validates :order, {presence: true}
    validates :price, {presence: true}

    Reservation.all.sum(:price)
end
