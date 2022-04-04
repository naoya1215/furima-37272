class Item < ApplicationRecord
  # アソシエーション(関連付け)
  belongs_to :user
end
