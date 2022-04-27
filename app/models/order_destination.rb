# Formオブジェクトを用いた実装
class OrderDestination
	include ActiveModel::Model #form_withメソッドに対応する機能とバリデーションを行う機能を、作成したクラスに持たせる
	#orderテーブルとdonationsテーブルに保存したいカラム名を、すべて指定
	attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone, :user_id, :item_id

	#バリデーションの記述を行う
	with_options presence: true do
 		validates :city, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, format: {with: /\A[0-9]+\z/}
    validates :user_id
    validates :item_id
  end
    validates :prefecture_id, numericality:{ other_than: 1, message: "can't be blank" }

  # 各テーブルにデータを保存する処理を書く
  def save
    # 購入記録を保存し、変数orderに代入
    order = Order.create(user_id: user_id, item_id: item_id)
    # prefecture_idには、変数prefectureのidと指定する
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone: phone, order_id: order.id)
  end
end