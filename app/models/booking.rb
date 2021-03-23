class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :guest, class_name: 'User', foreign_key: 'guest_id'
  scope :available_date, -> (start_date, end_date, space_id) { where(space_id: space_id).merge(self.where("start_date <= ? AND end_date >= ?", start_date, start_date).or(self.where("start_date <= ? AND end_date >= ?",end_date,end_date)).or(self.where("start_date >= ? AND end_date <= ?", start_date,end_date))) }
end
