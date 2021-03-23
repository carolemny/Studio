module CreateConversation
  private
  
  def create_conversation

    puts "@"*50
    puts params
    puts session[:guest_id]
    puts session[:space_id] 
    @space = Space.find(session[:space_id])
    puts @space.host_id
    puts "@"*50
  
    @conversation = Conversation.new(sender_id: @space.host_id, recipient_id: current_user.id)

    if Conversation.between(@space.host_id, current_user.id).present?
      @conversation = Conversation.between(@space.host_id, current_user.id).first
      flash[:notice] = "Vous pouvez maintenant contacter l'hôte"
    else 
      @conversation = Conversation.save
      flash[:error] = "Il semblerait qu'il y ait un problème"
    end 
  end 
end 

    
