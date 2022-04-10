require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品投稿機能' do
    context "商品登録が出来る場合" do
      it "image(画像), name(商品名), explanation(商品説明), category_id(カテゴリ), status_id(商品状態),responsibility_id(配送料の負担), prefecture_id(発送元の地域), shipping_id(発送までの日数), price(価格)が存在すれば登録ができる" do
        expect(@item).to be_valid
      end
      it "name(商品名)が40文字以下であれば保存ができる" do
        @item.name = "a"*40
        expect(@item).to be_valid
      end
      it "explanation(商品説明)が1000文字以下であれば登録ができる" do
        @item.explanation = "a"*1000
        expect(@item).to be_valid
      end
      it "price(価格)が￥300以上であれば登録ができる" do
        @item.price = 300
        expect(@item).to be_valid
      end
      it "price(価格)が￥9,999,999以下であれば登録ができる" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end
    context "商品登録ができない場合" do
      it "image(画像)が空だと登録できない" do
      end
    #   it "name(商品名)が空だと登録できない" do
    #   end
    #   it "explanation(商品説明)が空だと登録できない" do
    #   end     
    #   it "category_id(カテゴリ)が空だと登録できない" do
    #   end
    #   it "status_id(商品状態)が空だと登録できない" do
    #   end     
    #   it "responsibility_id(配送料の負担)が空だと登録できない" do
    #   end
    #   it "prefecture_id(発送元の地域)が空だと登録できない" do
    #   end     
    #   it "shipping_id(発送までの日数), price(価格)が空だと登録できない" do
    #   end
    #   it "price(価格)が空だと登録できない" do
    #   end     
    #   it "name(商品名)が40文字以上だと登録できない" do
    #   end
    #   it "explanation(商品説明)が1000文字以上だと登録できない" do
    #   end     
    #   it "price(価格)が￥300以下だと登録ができない" do
    #   end
    #   it "price(価格)が￥9,999,999以上だと登録ができない" do
    #   end
    # end
  end
end
