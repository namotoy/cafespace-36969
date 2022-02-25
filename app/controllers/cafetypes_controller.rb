class CafetypesController < ApplicationController
  def index
    @cafetypes = Cafetype.all.order('created_at DESC')
  end
  
  def new
    @cafetype = Cafetype.new
  end

  def create
    @cafetype = Cafetype.create(cafetype_params)
    if @cafetype.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def cafetype_params
    params.require(:cafetype).permit(:shop_name, :image, :catch_copy, :prefecture_id, :city, :block_number, :wifi, :power_supply, :capacity, :toilet_place, :cafe_price).merge(user_id: current_user.id)
  end

end
