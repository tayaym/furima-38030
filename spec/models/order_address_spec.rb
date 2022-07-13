require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    describe '配送先情報の保存' do
      context '配送先情報の保存ができるとき' do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_address).to be_valid
        end
        it '郵便番号が「3桁+ハイフン+4桁」の組み合わせであれば保存できる' do
          @order_address.postal_code = '000-0000'
          expect(@order_address).to be_valid
        end
        it '都道府県が「---」以外かつ空でなければ保存できる' do
          @order_address.region_id = 1
          expect(@order_address).to be_valid
        end
        it '市区町村が空でなければ保存できる' do
          @order_address.city = '川崎市'
          expect(@order_address).to be_valid
        end
        it '番地が空でなければ保存できる' do
          @order_address.house_number = '中原区000'
          expect(@order_address).to be_valid
        end
        it '建物名が空でも保存できる' do
          @order_address.building_name = nil
          expect(@order_address).to be_valid
        end
        it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
          @order_address.telephone_number = 12_345_678_910
          expect(@order_address).to be_valid
        end
      end
  
      context '配送先情報の保存ができないとき' do
        it 'user_idが空だと保存できない' do
          @order_address.user_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空だと保存できない' do
          @order_address.item_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
        it '郵便番号が空だと保存できないこと' do
          @order_address.postal_code = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
        end
        it '郵便番号にハイフンがないと保存できないこと' do
          @order_address.postal_code = 0000000
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
        end
        it '都道府県が「---」だと保存できないこと' do
          @order_address.region_id = 0
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Region can't be blank")
        end
        it '都道府県が空だと保存できないこと' do
          @order_address.region_id = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Region can't be blank")
        end
        it '市区町村が空だと保存できないこと' do
          @order_address.city = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("City can't be blank")
        end
        it '番地が空だと保存できないこと' do
          @order_address.house_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("House number can't be blank")
        end
        it '電話番号が空だと保存できないこと' do
          @order_address.telephone_number = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Telephone number can't be blank")
        end
        it '電話番号にハイフンがあると保存できないこと' do
          @order_address.telephone_number = '000 - 0000 - 0000'
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
        end
        it '電話番号が12桁以上あると保存できないこと' do
          @order_address.telephone_number = 00000000000000000
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include('Telephone number is invalid')
        end
        it 'トークンが空だと保存できないこと' do
          @order_address.token = ''
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
      end
    end
  end
end