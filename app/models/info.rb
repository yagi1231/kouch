class Info < ApplicationRecord
  validates :name, {presence: true}
  validates :address, {presence: true}
  validates :telnum, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
  
  scope :get_by_telnum, ->(telnum) {
    where("telnum like ?", "%#{telnum}%")
  }
end
