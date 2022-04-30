require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    # 正常系
    context '商品購入ができる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_destination).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @order_destination.building = ''
        expect(@order_destination).to be_valid
      end
    end

    # 異常系
    context '商品購入ができない場合' do
      it 'post_code(郵便番号)が空だと保存できないこと' do
        @order_destination.post_code = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_code(郵便番号)が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_destination.post_code = 3850034
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture(都道府県)を選択していないと保存できないこと' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'city(市区町村)が空だと保存できないこと' do
        @order_destination.city = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it 'address(番地)が空だと保存できないこと' do
        @order_destination.address = ''
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone(電話番号)が空だと保存できないこと' do
        @order_destination.phone = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phone(電話番号)が9桁以下では保存ができないこと' do
        @order_destination.phone = '123456789'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone is invalid")
      end
      it 'phone(電話番号)が12桁以上では保存ができないこと' do
        @order_destination.phone = '123456789012'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone is invalid")
      end
      it '電話番号に半角数字以外が含まれている場合は購入できない' do
        @order_destination.phone = '１２３４５６７８９０'
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone is invalid")
      end
      it 'tokenが空では登録できないこと' do
        @order_destination.token = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐付いていなければ購入できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていなければ購入できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
