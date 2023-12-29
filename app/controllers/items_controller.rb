class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update,:edit]
  before_action :move_to_index, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")

  end

  def new
    @item = Item.new
  end

  def show
  end

  def edit
  end

  def update

    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit, status: :unprocessable_entity
    end

  end

  def destroy
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    redirect_to action: :index if current_user.id != @item.user_id
  end

  def item_params
    params.require(:item).permit(:image, :title, :content, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

end
