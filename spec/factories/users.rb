FactoryBot.define do
  factory :user do

    japanese_user = Gimei.name

    nickname { Faker::Internet.username }
    last_name { japanese_user.last.kanji }
    first_name { japanese_user.first.kanji }
    last_name_kana { japanese_user.last.katakana }
    first_name_kana { japanese_user.first.katakana }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    birthday { Faker::Date.birthday }
  end
end
