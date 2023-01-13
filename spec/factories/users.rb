FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end

    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6, special_characters: false) }
    password_confirmation { password }
    first_name            { person.first.kanji }
    last_name             { person.last.kanji }
    kana_first_name       { person.first.katakana }
    kana_last_name        { person.last.katakana }
    birth_day             { Faker::Date.birthday }
  end
end
