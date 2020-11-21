require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品購入機能について' do
    context 'できる時' do
      it '情報が全てある時' do
      expect(@order).to be_valid
      end
      it '建物名がない' do
        @order.building_name = ""
        expect(@order).to be_valid
      end
    end

    context 'できない時' do
      it '郵便番号が空' do
        @order.postal_code = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号-の位置が違う' do
        @order.postal_code = "11-1111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号-がない' do
        @order.postal_code = "1111111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '郵便番号7桁じゃない' do
        @order.postal_code = "1111-1111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空' do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空' do
        @order.municipality = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地' do
        @order.address = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空' do
        @order.phone_number = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に-がある' do
        @order.phone_number ="111-1111-111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number ハイフン不要")
      end
      it '電話番号が9桁以下' do
        @order.phone_number ="111-1111-111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number ハイフン不要")
      end
      it '電話番号が12桁以上' do
        @order.phone_number ="111-1111-111"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number ハイフン不要")
      end
      it 'tokenが空' do
        @order.token = ""
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
