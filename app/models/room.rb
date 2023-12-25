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
end
