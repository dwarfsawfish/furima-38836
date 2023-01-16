class ItemsController < ApplicationController
  before_action :move_to_sign_in, except: :index

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

  private

  def move_to_sign_in
    return if user_signed_in?

    redirect_to new_user_registration_path
  end

  def item_params
    params.require(:item).permit(:name, :content, :price, :image, :category_id, :status_id, :postage_id, :sender_address_id,
                                 :day_to_ship_id).merge(user_id: current_user.id)
  end
end
