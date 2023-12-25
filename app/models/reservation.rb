class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def room
    #インスタンスメソッドないで、selfはインスタンス自身を表す
    return Room.find_by(id: self.room_id)
  end
end
