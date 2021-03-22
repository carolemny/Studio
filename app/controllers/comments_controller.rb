class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: [:show, :new, :create, :edit]

  # POST /comments or /comments.json
  def create
    @space = Space.find(params[:space_id])
    @comment = @space.comments.new(comment_params)

    redirect_to space_path(@space.id)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @space, notice: "Comment was successfully created." }
      else
        format.html {redirect_to space_path(@space.id), notice: "Error", status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: "Comment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
      @space = Space.find(params[:space_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:title, :content)
    end
end
