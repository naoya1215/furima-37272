class ItemsController < ApplicationController
  # exceptを使用(index, showは除きユーザーがログインしているかを確認する)
  # ログインをしていない場合は、ログインページに遷移される
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

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
    # @item = Item.find(params[:id]) #リファクタリング
  end

  def edit # 編集ページへ
    # new.html.erbからクリックされた情報をパラメータとして受け取り、edit.html.erbで編集ページを表示
    # @item = Item.find(params[:id]) #リファクタリング
    # 商品出品者以外が編集画面にアクセスしようとするとトップページに遷移される
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update # 更新処理
    # error_messages.html.erbでmodelオプションを使用しているため、@item(インスタンス変数)を使用する必要がある
    # @item = Item.find(params[:id]) #リファクタリング

    # 変更があった場合の処理
    if @item.update(item_params)
      # redirect_to(ルーティング→コントローラ→ビュー)、情報が更新されているのでぐるっとしているイメージ？
      redirect_to item_path
    # 変更がなかった場合の処理
    else
      # render(ビューに直接)
      render :edit
    end
  end

  def destroy #出品商品の削除
    # @item = Item.find(params[:id]) #リファクタリング
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :status_id, :responsibility_id, :prefecture_id, :shipping_id,
                                 :price, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @item = Item.find(params[:id])
  end
end
