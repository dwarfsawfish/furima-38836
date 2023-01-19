class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :find_item, only: [:index, :create]

  def index
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    else
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address =  OrderAddress.new(order_params)

    if @order_address.valid?
      Payjp.api_key = "sk_test_3c5e9579580ed1ce3048bde5"
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price,
        card: order_params[:token],
        currency: 'jpy'
      )
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :phone_number, :sender_address_id, 
    :municipality, :address, :building).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def find_item
    @item = Item.find(params[:item_id])
  end
end
