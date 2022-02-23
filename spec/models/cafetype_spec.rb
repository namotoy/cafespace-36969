require 'rails_helper'

RSpec.describe Cafetype, type: :model do
  before do
    @cafetype = FactoryBot.build(:cafetype)
  end

  describe '投稿の保存' do
    
    context '投稿が保存できる場合' do
      it '全ての値が入力されていれば投稿できる' do
        expect(@cafetype).to be_valid
      end
    end

    context '投稿が保存できない場合' do
      it '店舗画像がないと保存できない' do
        @cafetype.image = nil
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("Image can't be blank")
      end
      it '店舗名がないと保存できない' do
        @cafetype.shop_name = ''
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("Shop name can't be blank")
      end
      it '店舗キャッチコピーがないと保存できない' do
        @cafetype.catch_copy = ''
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("Catch copy can't be blank")
      end
      it '都道府県を選択していないと保存できない' do
        @cafetype.prefecture_id = '0'
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できない' do
        @cafetype.city = ' '
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと保存できない' do
        @cafetype.block_number = ' '
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("Block number can't be blank")
      end
      it 'Wifiの情報がないと保存できない' do
        @cafetype.wifi = '0'
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("Wifi can't be blank")
      end
      it '電源の情報がないと保存できない' do
        @cafetype.power_supply = '0'
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("Power supply can't be blank")
      end
      it '席数の情報がないと保存できない' do
        @cafetype.capacity = '0'
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("Capacity can't be blank")
      end
      it 'トイレ場所の情報がないと保存できない' do
        @cafetype.toilet_place = '0'
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("Toilet place can't be blank")
      end
      it 'コーヒー価格の情報がないと保存できない' do
        @cafetype.cafe_price = ''
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include("Cafe price can't be blank")
      end
      it '価格が100円未満では保存できない' do
        @cafetype.cafe_price = '80'
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include('Cafe price out of setting range')
      end
      it '価格が9999円を超えると保存できない' do
        @cafetype.cafe_price = '10000'
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include('Cafe price out of setting range')
      end
      it '価格が全角数字では保存できない' do
        @cafetype.cafe_price = '１００００'
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include('Cafe price is invalid. Input half-width characters')
      end
      it 'userが紐付いていなければ保存できない' do
        @cafetype.user = @user
        @cafetype.valid?
        expect(@cafetype.errors.full_messages).to include('User must exist')
      end
    end
  end
end
