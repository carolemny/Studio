class ConversationsController < ApplicationController
    before_action :authenticate_user!

    def index	
   
    end

    def show 
        puts "X" * 100
        puts params 
        puts "X" * 100
        @conversation = Conversation.find(params[:id])
        @messages = Message.where(conversation_id: @conversation.id).order(:created_at)
    
    end 
    
	end 
