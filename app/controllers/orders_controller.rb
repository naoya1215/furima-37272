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
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  def order_params
    params.require(:order_destination).permit(:post_code, :prefecture_id, :city, :address, :building, :phone).merge(user_id:current_user.id, item_id:@item.id)
  end
end
