class Booking < ApplicationRecord
  after_create :send_mail
  after_create :send_private_message
  belongs_to :space
  belongs_to :guest, class_name: 'User', foreign_key: 'guest_id'
  scope :available_date, -> (start_date, end_date, space_id) { where(space_id: space_id).merge(self.where("start_date <= ? AND end_date >= ?", start_date, start_date).or(self.where("start_date <= ? AND end_date >= ?",end_date,end_date)).or(self.where("start_date >= ? AND end_date <= ?", start_date,end_date))) }


  def send_mail
    @user_id = self.guest_id
    UserMailer.booking_email(@user_id, self).deliver_now
  end 
  
  def send_private_message

    @space = Space.find(self.space_id)

    if Conversation.between(@space.host_id, self.guest_id).present?
      @conversation = Conversation.between(@space.host_id, self.guest_id).first
     else 
      @conversation = Conversation.create(contact1_id: @space.host_id, contact2_id: self.guest_id)
     end
     
    Message.create(conversation_id: @conversation.id, 
    user_id: @space.host_id, 
    body: "Merci pour ta réservation #{self.guest.full_name} concernant \"#{@space.title}\" du #{self.start_date} au #{self.end_date} ! 
    N'hésite pas à me contacter pour toute question éventuelle."
    )

  end 
end

