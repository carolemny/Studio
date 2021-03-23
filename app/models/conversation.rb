class Conversation < ApplicationRecord

  has_many :messages, dependent: :destroy
  belongs_to :contact1, class_name: 'User'
  belongs_to :contact2, class_name: 'User'

  scope :between, -> (contact1_id, contact2_id) do 
    where("(conversations.contact1_id = ? AND conversations.contact2_id  =?) OR (conversations.contact1_id = ? AND conversations.contact2_id  =?)", 
    contact1_id, contact2_id, contact2_id, contact1_id)
    end
end
