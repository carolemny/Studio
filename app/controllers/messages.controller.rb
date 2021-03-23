class MessagesController < ApplicationController
    before_action do
    @conversation = Conversation.find(params[:conversation_id])
    end
  
    def index
     @messages = @conversation.messages
     @message = @conversation.messages.new
     puts "x" * 100
     puts params
     puts "x" * 100
    end 
  
    def new
      @message = @conversation.messages.new
    end
  
    def create
        puts "x" * 100
        puts params
        puts "x" * 100
      @message = @conversation.messages.new(message_params)
        if @message.save
          redirect_to conversation_messages_path(@conversation.id)
        end
    end
  
    private
     def message_params
      params.permit(:body,:recipient_id, user_id)
     end
  
  end
     
  