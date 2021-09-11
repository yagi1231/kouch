class Reservation < ApplicationRecord
    validates :name, {presence: true}
    validates :address, {presence: true}
    validates :telnum, {presence: true}
    validates :order, {presence: true}

end
