class CommentsController < ApplicationController
    def create
      @space = Space.find(params[:space_id])
      @comment = Comment.new(content: params[:comment][:content], user_id: current_user.id, space_id: @space.id)
     
      respond_to do |format|
        if @comment.save
          format.html { redirect_to @space}
          format.js { }
        else
          format.html {redirect_to space_path(@space.id), notice: "Error", status: :unprocessable_entity }
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

end
          

        
        

        


