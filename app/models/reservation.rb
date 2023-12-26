class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def room
    #インスタンスメソッドないで、selfはインスタンス自身を表す
    return Room.find_by(id: self.room_id)
  end

  def days 
    # @reservation.end_date - @reservation.start_date
    end_date - start_date
  end

  def price
    @days * @room.fee * @reservation.number_people
  end
end
