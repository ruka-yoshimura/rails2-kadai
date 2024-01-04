class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  mount_uploader :img, ImgUploader
  has_many :rooms
  has_many :reservations

  def rooms
    return Room.where(user_id: self.id)
  end

  def reservations
  return Reservation.where(user_id: self.id)
  return Reservation.where(room_id: self.id)
  end

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create
  validates :password, presence: true, on: :update, allow_blank: true
  validates :password_confirmation, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :update, allow_blank: true
end
