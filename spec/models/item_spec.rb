require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品登録' do
    context '内容に問題ない場合' do
      it 'item_nameとitem_text、category_id、item_state_id、paying_for_shipping_id、
      shipping_area_id、shipping_day_id、imageが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_textが空では登録できない' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item text can't be blank")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category select')
      end
      it 'item_state_idが1では登録できない' do
        @item.item_state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item state select')
      end
      it 'paying_for_shipping_idが1では登録できない' do
        @item.paying_for_shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Paying for shipping select')
      end
      it 'shipping_area_idが1では登録できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area select')
      end
      it 'shipping_day_idが1では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping day select')
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが、300~9,999,999の間でなければ登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが、半角数字でなければ登録できない(全角数字の場合登録できない)' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'priceが、半角数字でなければ登録できない(数字以外が含まれる場合登録できない)' do
        @item.price = 'abc12'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
    end
  end
end
