class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーションの記述(空欄の場合は保存をしない)
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :birthday, presence: true

  # アソシエーション（関連付け）
  has_many :items
  has_many :orders

  # パスワードは、半角英数字混合での入力が必須であること
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX
  # 苗字は、全角ひらがな、全角カタカナ、漢字
  LAST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates_format_of :last_name, with: LAST_NAME_REGEX
  # 名前は、全角ひらがな、全角カタカナ、漢字
  FIRST_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  validates_format_of :first_name, with: FIRST_NAME_REGEX
  # ミョウジは、全角カタカナ
  LAST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :last_name_kana, with: LAST_NAME_KANA_REGEX
  # ナマエは、全角カタカナ
  FIRST_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  validates_format_of :first_name_kana, with: FIRST_NAME_KANA_REGEX
end
