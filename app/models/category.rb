class Category < ApplicationRecord
  has_many :join_space_categories
  has_many :spaces, through: :join_space_categories
end
