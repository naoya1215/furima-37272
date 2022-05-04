class Item < ApplicationRecord
  # アソシエーション(関連付け)
  belongs_to :user
  has_one :order
  has_one_attached :image


  # extend ActiveHash::Associations::ActiveRecordExtensionsと記述してmoduleを取り込む
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :responsibility
  belongs_to :prefecture
  belongs_to :shipping

  # 空の投稿を保存できないようにする
  validates :name, presence: true, length: { maximum: 40 }
  validates :explanation, presence: true, length: { maximum: 1000 }
  validates :image, presence: true
  # 価格は、￥300〜9,999,999の時に保存が出来る
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  # ジャンルの選択が「---」の時は保存できないようにする
  validates :category_id, :status_id, :responsibility_id, :prefecture_id, :shipping_id,
            numericality: { other_than: 1, message: "を入力してください" }

  # パスワードは、半角英数字混合での入力が必須であること
  # PRICE_REGEX = /\A[0-9]+\z/.freeze
  # validates_format_of :price, with: PRICE_REGEX
end
