class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :show, :create, :edit, :update, :destroy]
  before_action :is_my_gossip, only: [:edit, :update, :destroy]


  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new('title' => params[:title], 'content' => params[:content], 'user_id' =>  current_user.id)
    if @gossip.save
      redirect_to gossip_path(@gossip.id), notice: "Gossip créé avec succès"
    else
      render :new
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossip_params)
      redirect_to gossip_path(@gossip.id), notice:"Ton potin a été mis à jour !"
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end

  private

  def is_my_gossip
    @gossip = Gossip.find(params[:id])
    unless current_user == @gossip.user
      flash[:danger] = "Ce n'est pas votre potin"
      redirect_to gossip_path(@gossip.id)
    end
  end
end
