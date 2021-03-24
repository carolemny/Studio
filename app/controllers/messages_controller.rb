class MessagesController < ApplicationController
  before_action :set_conversation
 
  def create
    @message = Message.new(conversation_id: @conversation.id, user_id: current_user.id, body: params[:body])
    @messages = Message.includes(:user).where(conversation_id: @conversation.id).order(:created_at)

    respond_to do |format|
      if @message.save
        format.html {redirect_to conversation_path(@conversation.id)}
        format.js {}
      else
        format.html {redirect_to conversation_path(@conversation.id), flash[:error] = "Votre message n'a pas été envoyé."}
      end
    end
  end
  
  private
   
  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end 
  
end
     
  