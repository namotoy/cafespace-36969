class CafetypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_cafetype, except: [:index, :new, :create]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
  def index
    @cafetypes = Cafetype.includes(:user).order('created_at DESC')
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

  def show
   
  end

  def edit
    
  end
  
  def update
    
    if @cafetype.update(cafetype_params)
      redirect_to cafetype_path
    else
      render :edit
    end
  end



  private
  def cafetype_params
    params.require(:cafetype).permit(:shop_name, :image, :catch_copy, :prefecture_id, :city, :block_number, :wifi_id, :power_supply_id, :capacity_id, :toilet_place_id, :cafe_price).merge(user_id: current_user.id)
  end

  def set_cafetype
    @cafetype = Cafetype.find(params[:id])
  end

  def move_to_index
    unless current_user == @cafetype.user
      redirect_to root_path
    end
  end

end
