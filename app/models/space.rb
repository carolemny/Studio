class Space < ApplicationRecord
  
  scope :filter_by_city, -> (city) { where("lower(city) like ?", "#{city}%") } 
  scope :filter_by_category, -> (category) { Space.joins(:join_space_categories).merge(JoinSpaceCategory.where(category_id: category)) }
  belongs_to :host, class_name: 'User', foreign_key: 'host_id'
  has_many :bookings
  has_many :guests, through: :bookings
  has_many :join_space_categories
  has_many :categories, through: :join_space_categories
  has_many_attached :images
  
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address, city, zip_code, 'France'].compact.join(', ')
  end

end
