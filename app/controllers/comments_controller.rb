class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:create, :edit, :update, :destroy]


  def create
    @comment = Comment.new('content' => params[:content], 'gossip_id' => params[:gossip_id],'user_id' => current_user.id)
    if @comment.save
      redirect_to gossip_path(@comment.gossip.id), notice: "Commentaire créé avec succès"
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    # comment_params = params.require(:comment).permit(:content, :gossip_id)
    if @comment.update(content: params[:content], gossip_id: params[:gossip_id])
      redirect_to gossip_path(@comment.gossip.id), notice:"Ton commentaire a été mis à jour !"
    else
      render 'edit'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to gossip_path(@comment.gossip.id)
  end

  # GET /comments/1/edit
  # def edit
  #   params.require(:comment).permit(:title, :content)
  # end

  # POST /comments
  # POST /comments.json


  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json

#
#   # DELETE /comments/1
#   # DELETE /comments/1.json
#   def destroy
#     @comment.destroy
#     respond_to do |format|
#       format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end
#
#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_comment
#       @comment = Comment.find(params[:id])
#     end
#
#     # Only allow a list of trusted parameters through.
#     def comment_params
#       params.require(:comment).permit(:title, :content)
#     end
end
