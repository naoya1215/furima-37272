FactoryBot.define do
  factory :user do
    # gem 'faker'をインストールしているためFakerを使用できる
    # これはランダムに値を生成してくれる
    nickname                { Faker::Name.initials }
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    first_name              { '柳沢' }
    last_name               { '直也' }
    first_name_kana         { 'ヤナギサワ' }
    last_name_kana          { 'ナオヤ' }
    birthday                { '1992-12-15' }
  end
end
