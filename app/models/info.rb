class Info < ApplicationRecord
  validates :name, presence: true,
                 format: {
                   with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                   message: "全角カタカナのみで入力して下さい"
                 }
  validates :address, {presence: true}
  validates :telnum, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
  
  scope :get_by_telnum, ->(telnum) {
    where("telnum like ?", "%#{telnum}%")
  }
end
