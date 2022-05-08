FactoryBot.define do
  factory :order_destination do
    post_code { '385-0034' }
    prefecture_id { 17 }
    city { '佐久市' }
    address { '平賀2094-1' }
    building { 'フィアレス201' }
    phone { '09046215647' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
