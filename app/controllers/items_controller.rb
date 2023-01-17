class ItemsController < ApplicationController
  before_action :move_to_sign_in, except: [:index, :show]
  before_action :authenticate_user!, only: :edit
  before_action :find_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    return unless user_signed_in? && current_user.id == @item.user_id

    @item.destroy
    redirect_to root_path
  end

  private

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_session_path
  end

  def item_params
    params.require(:item).permit(:name, :content, :price, :image, :category_id, :status_id, :postage_id, :sender_address_id,
                                 :day_to_ship_id).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
