class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :set_prototype, only: [:index, :create]
  def index
    # 自らの出品商品を購入できない
    redirect_to root_path if (current_user.id == @item.user_id) || @item.order.present?
    # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入
    @order_destination = OrderDestination.new
  end

  def create
    # 値をDBへ保存する実装
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      # 決算処理
      Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 環境変数を呼び込むようにした為
      Payjp::Charge.create(
        amount: @item.price, # 商品の値段
        card: order_params[:token], # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )

      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :building, :phone).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_prototype
    @item = Item.find(params[:item_id])
  end
end
