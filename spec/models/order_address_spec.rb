require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品が購入できる時' do
      it 'すべての情報が正しく入力されている時' do
        expect(@order_address).to be_valid
      end

      it '建物名(building)が空で、他の情報は正しく入力されている時' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '商品が購入できない時' do
      it '郵便番号(postal_code)が空の時' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が全角文字列の時' do
        @order_address.postal_code = '３３３-３３３３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号は半角だがハイフンが入ってない時' do
        @order_address.postal_code = '3333333'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号の文字数の規定を超えている時' do
        @order_address.postal_code = '33333-333333333'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県選択(sender_address_id)が1の時' do
        @order_address.sender_address_id = '1'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Sender address can't be blank")
      end

      it '市町村(municipality)が空の時' do
        @order_address.municipality = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '番地(address)が空の時' do
        @order_address.address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号(phone_number)が空の時' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が全角数字の時' do
        @order_address.phone_number = '０９０１１１１２２２２'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号は半角だがハイフンが入っている時' do
        @order_address.phone_number = '090-1111-2222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が９桁以下の時' do
        @order_address.phone_number = '0901111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が12桁以下の時' do
        @order_address.phone_number = '0901111222222'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空の時' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐づいてない時' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐づいてない時' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
