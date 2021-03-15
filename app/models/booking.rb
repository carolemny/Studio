class Booking < ApplicationRecord
  belongs_to :space
  belongs_to :guest, class_name: 'User', foreign_key: 'guest_id'
end
