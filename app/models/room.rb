class Room < ApplicationRecord
  # belongs_to :room, optional: true
  belongs_to :user
  def user
    #インスタンスメソッドないで、selfはインスタンス自身を表す
    return User.find_by(id: self.user_id)
  end
  mount_uploader :img, ImgUploader
end
