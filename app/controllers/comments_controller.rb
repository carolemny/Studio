class CommentsController < ApplicationController
  before_action :is_user_guest?, only: [:create]

    def create
      @space = Space.find(params[:space_id])
      @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, space_id: @space.id)
     
      respond_to do |format|
        if @comment.save
          format.html { redirect_to @space}
          format.js { }
        else
          format.html {redirect_to space_path(@space.id), notice: "Votre commentaire n'a pas été envoyé", status: :unprocessable_entity }
          format.js { }
        end
      end

    end

    def destroy
      @space = Space.find(params[:space_id])
      @comment = Comment.find(params[:id])
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to space_path(@space.id)}
        format.js { }
      end
    end

    private 
    
    def is_user_guest?
      @space = Space.find(params[:space_id])
      
      unless @space.guests.include?(current_user)
        flash[:error] = "Vous ne pouvez pas commenter sans avoir effectué de réservation."
        redirect_to space_path(@space.id)
      end
    end


end
          

        
        

        


