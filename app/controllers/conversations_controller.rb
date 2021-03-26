class ConversationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_conversation, only: [:show]
    before_action :restrict_access, only: [:show]
    
    def index
    end 

    def show

    @conversation = Conversation.find(params[:id])
    @messages = Message.includes(:user).where(conversation_id: @conversation.id).order(:created_at)

    end 

    private 

    def set_conversation
      @conversation = Conversation.find(params[:id])
    end 

    def restrict_access

      unless current_user.id == @conversation.contact1_id || current_user.id == @conversation.contact2_id
        redirect_to conversations_path
      end 

    end 
end 

