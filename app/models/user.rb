class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


         mount_uploader :img, ImgUploader
         has_one_attached :img
         has_many :rooms
        #  validates :user_id, {presence: true}
         def rooms
          return Room.where(user_id: self.id)
        end
end
