class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user

  def room
    #インスタンスメソッドないで、selfはインスタンス自身を表す
    return Room.find_by(id: self.room_id)
  end

  # def number_of_date
  #   days = end_date - start_date
  # end

  # def amount
  #   days = self.number_of_date
  #   price = Room.find(self.room_id).fee * number_people * days
  # end

  def days
    end_date - start_date
  end

  def all_price
    # (@reservation.end_date - @reservation.start_date) * @reservation.room.fee * @reservation.number_people
    # end_date - start_date * number_people
    # end_date - start_date
    # (end_date - start_date) * @room.fee * number_people
    # days * room.fee * number_people
  end


  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :number_people, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}


  validate :today_start_check

  def today_start_check
    return if start_date.blank?
    errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
  end


  validate :start_end_check
  
  def start_end_check
    errors.add(:end_date, "は開始日より前の日付は登録できません。") unless
    self.start_date < self.end_date
  end
end
