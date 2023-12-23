require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる時' do
      it '正しいデータが入力されている場合' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない時' do
      it 'titleが空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空では登録できない' do
        @item.content = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Content can't be blank")
      end

      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空では登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_day_idが空では登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格は半角数値で入力しないと登録できない' do
        @item.price = 'a'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'priceが300未満の場合は無効であること' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to include('must be greater than or equal to 300')
      end

      it 'priceが9,999,999を超える場合は無効であること' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors[:price]).to include('must be less than or equal to 9999999')
      end

      it 'priceに全角数字が入力されている場合は無効であること' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors[:price]).to include('is not a number')
      end
    end
  end
end
