class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :update]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
    return if user_signed_in?

    redirect_to new_user_session_path
    nil
  end

  def destroy
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      puts @item.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :title, :content, :category_id, :condition_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price)
  end
end
