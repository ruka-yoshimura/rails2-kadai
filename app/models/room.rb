class Room < ApplicationRecord
  # belongs_to :room, optional: true
  belongs_to :user
  before_destroy
  def user
    #インスタンスメソッドないで、selfはインスタンス自身を表す
    return User.find_by(id: self.user_id)
  end

  def self.search(search)
    return Room.all unless search
    # Room.where('name LIKE(?)', "%#{search}%")
  end



  mount_uploader :room_img, ImgUploader
end
