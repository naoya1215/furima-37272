class Item < ApplicationRecord
  # アソシエーション(関連付け)
  belongs_to :user
  has_one_atached :image

  # extend ActiveHash::Associations::ActiveRecordExtensionsと記述してmoduleを取り込む
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :responsibility
  belongs_to :prefecture
  belongs_to :shipping_day

  # 空の投稿を保存できないようにする
  validates :name, :explanation, presence: true

  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :status_id, :responsibility_id, :prefecture_id, :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" } 
end
