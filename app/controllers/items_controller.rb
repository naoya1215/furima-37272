class ItemsController < ApplicationController
  # exceptを使用(index, showは除きユーザーがログインしているかを確認する)
  before_action :authenticate_user!, except: [:index, :show]

  def index # トップ画面の表示
    @items = Item.all.order(created_at: :desc)
  end

  def new # 新規作成
    @item = Item.new
  end

  def create # 保存
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :responsibility_id, :prefecture_id, :shipping_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
