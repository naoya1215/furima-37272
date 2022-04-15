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

  def show # 詳細ページへ
    # index.html.erbからクリックされた情報をパラメータとして受け取り、show.html.erbで詳細情報を表示
    @item = Item.find(params[:id])
  end

  def edit #編集ページへ
    # new.html.erbからクリックされた情報をパラメータとして受け取り、edit.html.erbで編集ページを表示
    @item = Item.find(params[:id])
  end

  def update #更新処理
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :responsibility_id, :prefecture_id, :shipping_id,
                                 :price, :image).merge(user_id: current_user.id)
  end
end
