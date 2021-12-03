class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
  has_many :infos
  has_many :reservations
  # 以下の1行を追記
  has_many :likes
 
  def liked_by?(reservation_id)
    likes.where(reservation_id: reservation_id).exists?
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
