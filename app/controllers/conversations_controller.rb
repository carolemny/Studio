class ConversationsController < ApplicationController
    before_action :authenticate_user!

    def index	
   	@users = User.all
    @conversations = Conversation.all
    end

	end 

    
    

       
   