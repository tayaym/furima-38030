require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品情報が保存できる場合' do
      it 'ログインと商品画像と商品の説明とカテゴリーと商品の状態と配送料の負担と発送元の地域と発送までの日数と価格が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品情報が保存できない場合' do
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it '商品画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品の説明がないと保存できない' do
        @item.profile = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Profile can't be blank")
      end

      it 'カテゴリーがないと保存ができない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態がないと保存できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("State can't be blank")
      end

      it '配送料の負担がないと保存ができない' do
        @item.delivery_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery can't be blank")
      end

      it '発送元の地域がないと保存できない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Region can't be blank")
      end

      it '発送までの日数がないと保存できない' do
        @item.time_count_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Time count can't be blank")
      end

      it '価格がないと保存ができない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end

      it '¥300未満だと保存できない' do
        @item.price = 1 * 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '¥10,000,000以上の数字だと保存できない' do
        @item.price = 1 * 100_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格が半角数字以外が含まれていると保存ができない' do
        @item.price = 'えええ'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'カテゴリーに「---」が選択されていると保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it '商品の状態に「---」が選択されていると保存できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("State must be other than 1")
      end

      it '配送料の負担に「---」が選択されていると保存できない' do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery must be other than 1")
      end

      it '発送元の地域に「---」が選択されていると保存できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 1")
      end

      it '発送までの日数に「---」が選択されていると保存できない' do
        @item.time_count_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Time count must be other than 1")
      end

      it '商品名が空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
