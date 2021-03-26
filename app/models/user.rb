class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :welcome_send

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hosted_spaces, foreign_key: 'host_id', class_name: "Space"
  has_many :bookings
  has_many :spaces, through: :bookings
  has_many :messages
  has_many :comments, dependent: :destroy
  has_many :conversations_as_contact1, foreign_key: 'contact1_id', class_name: "Conversation"
  has_many :conversations_as_contact2, foreign_key: 'contact2_id', class_name: "Conversation"
  has_one_attached :avatar

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
  
  def conversations
   self.conversations_as_contact1 + self.conversations_as_contact2 

  end 

  def full_name
    user_name = "#{self.first_name} #{self.last_name}" 
  
    if user_name.blank?
    user_name = self.email
    end 

  user_name 
  end 

  
end
