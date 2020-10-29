class LikesController < ApplicationController
  before_action :authenticate_user

  def create
    if already_liked?
      flash[:notice] = "Déjà liké"
    else
      @like = Like.create(user_id: current_user.id, gossip_id: params[:gossip_id])
    end
    redirect_to root_path
  end

  def find_like
   @like = @gossip.likes.find(params[:id])
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, gossip_id: params[:gossip_id])
    @like.destroy
    redirect_to root_path
  end


  private

  def already_liked?
    Like.where(user_id: current_user.id, gossip_id: params[:gossip_id]).exists?
  end
end
