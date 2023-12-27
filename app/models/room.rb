class Room < ApplicationRecord
  # belongs_to :room, optional: true
  belongs_to :user
  has_many :reservations
  def user
    #インスタンスメソッドないで、selfはインスタンス自身を表す
    return User.find_by(id: self.user_id)
  end

  def self.search(search)
    return Room.all unless search
    # Room.where('name LIKE(?)', "%#{search}%")
  end

  # accepts_nested_attributes_for :reservations

  mount_uploader :room_img, ImgUploader

  validates :room_name, presence: true
  validates :room_detail, presence: true
  validates :fee, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :address, presence: true
end
