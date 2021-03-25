class Comment < ApplicationRecord
  belongs_to :space
  belongs_to :user

  validates :content, presence: true 
end
