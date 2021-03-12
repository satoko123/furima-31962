require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end
  describe '商品購入' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @order_form.building = nil
        expect(@order_form).to be_valid
      end
    end
    context '内容に問題がある場合' do
      it 'postal_codeが空では保存できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it 'region_idが空では保存できない' do
        @order_form.region_id = 1
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Region Select')
      end
      it 'cityが空では保存できない' do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'street_addressが空では保存できない' do
        @order_form.street_address = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンがあると保存できない' do
        @order_form.phone_number = '000-0000-0000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @order_form.phone_number = '000000000000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end
