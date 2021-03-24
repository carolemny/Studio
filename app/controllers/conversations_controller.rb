class ConversationsController < ApplicationController
    before_action :authenticate_user!

    def index	
   
    end

    def show
        @conversation = Conversation.find(params[:id])
        @messages = Message.includes(:user).where(conversation_id: @conversation.id).order(:created_at)
    end 
    
end 
