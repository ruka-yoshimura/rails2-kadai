class Room < ApplicationRecord

  belongs_to :user
  has_many :reservations

  def user
    return User.find_by(id: self.user_id)
  end


  mount_uploader :room_img, BoardImageUploader

  validates :room_name, presence: true
  validates :room_detail, presence: true
  validates :fee, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :address, presence: true
end
