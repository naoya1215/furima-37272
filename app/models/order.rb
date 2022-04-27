class Order < ApplicationRecord
  # アソシエーション(関連付け)
  belongs_to :user
  belongs_to :item
  has_one :destination
end
