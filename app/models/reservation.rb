class Reservation < ApplicationRecord
    validates :name, presence: true,
    format: {
      with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
      message: "全角カタカナのみで入力して下さい"
    }
    validates :address, {presence: true}
    validates :telnum, {presence: true}
    validates :order, {presence: true}

    Reservation.all.sum(:price)
end
