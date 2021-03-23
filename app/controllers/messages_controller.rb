class MessagesController < ApplicationController
    before_action :set_conversation
 

    def create

      puts "X" * 300
      puts params 
      puts "X" * 300

     @message  = Message.new(conversation_id: @conversation.id, user_id: current_user.id, body: params[:body])

      if @message.save
          
        redirect_to conversation_path(@conversation.id)
          flash[:notice] = "Votre message a été posté."
        else 
          redirect_to conversation_path(@conversation.id)
          flash[:error] = "Votre message n'a pas été posté."
        end
    end
  
    private
   
     def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
     end 
  
  end
     
  