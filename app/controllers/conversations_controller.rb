class ConversationsController < ApplicationController
    before_action :authenticate_user!

    def index	
   
    end

    def show 
       
        @conversation = Conversation.find(params[:id])
        @messages = Message.where(conversation_id: @conversation.id).order(:created_at)
        @message = @conversation.messages.new

        puts "X" * 100
        puts @message
    
    
    end 
    
	end 
