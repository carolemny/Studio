class Space < ApplicationRecord
  belongs_to :host, class_name: 'User', foreign_key: 'host_id'
  has_many :bookings
  has_many :guests, through: :bookings
end
