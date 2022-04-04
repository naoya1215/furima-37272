class Item < ApplicationRecord
  # アソシエーション(関連付け)
  belongs_to :user
  has_one_atached :image
end
