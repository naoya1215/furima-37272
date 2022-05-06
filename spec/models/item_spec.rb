require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿機能' do
    # 正常系テスト
    context '商品登録が出来る場合' do
      it 'image(画像), name(商品名), explanation(商品説明), category_id(カテゴリ), status_id(商品状態),responsibility_id(配送料の負担), prefecture_id(発送元の地域), shipping_id(発送までの日数), price(価格)が存在すれば登録ができる' do
        expect(@item).to be_valid
      end
      it 'name(商品名)が40文字以下であれば保存ができる' do
        @item.name = 'a' * 40
        expect(@item).to be_valid
      end
      it 'explanation(商品説明)が1000文字以下であれば登録ができる' do
        @item.explanation = 'a' * 1000
        expect(@item).to be_valid
      end
      it 'price(価格)が￥300以上であれば登録ができる' do
        @item.price = 300
        expect(@item).to be_valid
      end
      it 'price(価格)が￥9,999,999以下であれば登録ができる' do
        @item.price = 9_999_999
        expect(@item).to be_valid
      end
    end
    # 異常系テスト
    context '商品登録ができない場合' do
      it 'image(画像)が空だと登録できない' do
        @item.image = nil # 画像の場合はnilを使用する
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'name(商品名)が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'explanation(商品説明)が空だと登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'category_id(カテゴリ)が未選択だと登録できない' do
        @item.category_id = 1
        @item.valid?
        # expect(@item.errors.full_messages).to include("Category can't be blank")
        expect(@item.errors.full_messages).to include("カテゴリを入力してください")
      end
      it 'status_id(商品状態)が未選択だと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品状態を入力してください")
      end
      it 'responsibility_id(配送料の負担)が未選択だと登録できない' do
        @item.responsibility_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'prefecture_id(発送元の地域)が未選択だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'shipping_id(発送までの日数)が未選択だと登録できない' do
        @item.shipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'price(価格)が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it '半角英数字以外が含まれていると登録できない' do
        @item.price = '３00'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'name(商品名)が41文字以上だと登録できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
      end
      it 'explanation(商品説明)が1001文字以上だと登録できない' do
        @item.explanation = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明は1000文字以内で入力してください")
      end
      it 'price(価格)が￥299以下だと登録ができない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it 'price(価格)が￥10,000,000以上だと登録ができない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
    end
  end
end
