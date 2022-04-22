# Formオブジェクトを用いた実装
class OrderDestination
	include ActiveModel::Model #form_withメソッドに対応する機能とバリデーションを行う機能を、作成したクラスに持たせる
	#orderテーブルとdonationsテーブルに保存したいカラム名を、すべて指定
	attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone, :user, :item

	#バリデーションの記述を行う
	with_options presence: true do
 		validates :city, :address, :building, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone, format: {with: /\A[0-9]+\z/}
    validates :user, :item
  end
  validates :prefecture_id, { other_than: 1, message: "can't be blank" }

  # 各テーブルにデータを保存する処理を書く
  def save
    # 購入記録を保存し、変数orderに代入
    order = Order.create(user: user, item: item)
    # prefecture_idには、変数prefectureのidと指定する
    Destination.create(prefecture_id: purefecture.id, prepost_code: post_code, city: city, address: address, building: bulding, phone: phone)
  end
end