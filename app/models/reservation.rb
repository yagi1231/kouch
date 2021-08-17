class Reservation < ApplicationRecord
    validates :name, {presence: true}
    validates :address, {presence: true}
    validates :telnum, {presence: true}
    validates :backtime, {presence: true}
    validates :order, {presence: true}

    scope :get_by_name, ->(name) {
    where("name like ?", "%#{name}%")
    }
end
