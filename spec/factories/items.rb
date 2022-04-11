FactoryBot.define do
  factory :item do
    name {Faker::Lorem.sentence}
    explanation {Faker::Lorem.sentence}
    category_id {2}
    status_id {2}
    responsibility_id {2}
    prefecture_id {2}
    shipping_id {2}
    price {1000}

    association :user 

    after(:build) do |item| #afterメソッド：インスタンスがbuildされた後に指定の処理
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
