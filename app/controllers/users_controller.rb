class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = User.find(params["id"])
  end

  def create
    @user = User.new('first_name' => params[:first_name], 'email' => params[:email], 'password' => params[:password], 'city_id' => 11)
    if @user.save
      redirect_to root_path, notice: "Bienvenu "
    else
      render :new
    end
  end

  # def edit
  #   @user = Gossip.find(params[:id])
  # end
  #
  # def update
  #   @user = Gossip.find(params[:id])
  #   user_params = params.require(:user).permit(:title, :content)
  #   if @user.update(user_params)
  #     redirect_to @user, notice:"Ton potin a été mis à jour !"
  #   else
  #     render :edit
  #   end
  # end
  #
  # def destroy
  #   @user = Gossip.find(params[:id])
  #   @user.destroy
  #   redirect_to root_path
  # end

end
