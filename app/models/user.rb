class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def liked_by?(reservation_id)
    likes.where(reservation_id: reservation_id).exists?
  end

  has_many :infos
  has_many :reservations
  has_many :likes

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
