class Space < ApplicationRecord
  
  scope :filter_by_city, -> (city) { where('lower(city) LIKE ?', "#{city.downcase}%") } 
  scope :filter_by_category, -> (category) { Space.joins(:join_space_categories).merge(JoinSpaceCategory.where(category_id: category)) }
  belongs_to :host, class_name: 'User'
  has_many :comments
  has_many :bookings
  has_many :guests, through: :bookings
  has_many :join_space_categories
  has_many :categories, through: :join_space_categories
  has_many_attached :images
  validates :description, length: {maximum: 500}
  validates :title, length: {maximum: 50}
  validates :zip_code, length: { is: 5 }
  validates :price, numericality: { only_integer: true }
  geocoded_by :full_address
  after_validation :geocode


  def full_address
    [address, city, zip_code, 'France'].compact.join(', ')
  end

end
