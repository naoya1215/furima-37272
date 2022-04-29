class OrdersController < ApplicationController
  def index
    # 商品情報を表示するためのインスタンス
    @item = Item.find(params[:item_id])
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入
    @order_destination = OrderDestination.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    # 値をDBへ保存する実装
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      # 決算処理
      #Payjp.api_key = "sk_test_9d65f712acf1933eb8751d24"  #直接秘密鍵を設定
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] #環境変数を呼び込むようにした為、15行目の記述は削除
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )

      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :building, :phone).merge(user_id:current_user.id, item_id:@item.id, token: params[:token])
  end
end
