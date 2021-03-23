class Message < ApplicationRecord

  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true 

  def message_time
    self.created_at.strftime(" le %m/%d/%Y")
  end
end
