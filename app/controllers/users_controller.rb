class UsersController < ApplicationController
  before_action :set_user, except: [:index, :new, :create, :search]
  
  def show
    # @user = User.find(params[:id])
  end

  def edit
    # @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :prefecture_id, :city)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
