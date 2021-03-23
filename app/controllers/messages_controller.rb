class MessagesController < ApplicationController
  before_action :set_conversation
 
  def create
    @message  = Message.new(conversation_id: @conversation.id, user_id: current_user.id, body: params[:body])

    if @message.save
      redirect_to conversation_path(@conversation.id)
    else 
      redirect_to conversation_path(@conversation.id)
      flash[:error] = "Votre message n'a pas été envoyé."
    end
  end
  
  private
   
  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end 
  
end
     
  