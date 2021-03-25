class ConversationsController < ApplicationController
    before_action :authenticate_user!
   
    def show

    @conversation = Conversation.find(params[:id])
    @messages = Message.includes(:user).where(conversation_id: @conversation.id).order(:created_at)

      unless current_user.id == @conversation.contact1_id || current_user.id == @conversation.contact2_id
        redirect_to conversations_path
      end 

    end 

end 

