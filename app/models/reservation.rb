class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :user
  
  def room
    return Room.find_by(id: self.room_id)
  end

  def days
    (end_date - start_date).to_i
  end

  def price
    days.to_i * fee.to_i * number_people.to_i
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
    return if start_date.blank? || end_date.blank?
    errors.add(:end_date, "はチェックインより前の日付は登録できません。") unless
    self.start_date < self.end_date
  end
end
