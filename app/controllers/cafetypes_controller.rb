class CafetypesController < ApplicationController
  def index
  
  end
  def new
    @cafetype = Cafetype.new
  end

  def create
    Cafetype.create(cafetype_params)
  end

  private
  def cafetype_params
    params.require(:cafetype).permit(:shop_name, :image, :catch_copy, :prefecture_id, :city, :block_number, :wifi, :power_supply, :capacity, :toilet_place).merge(user_id: current_user.id)
  end

end
