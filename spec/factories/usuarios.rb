FactoryBot.define do
  factory :usuario do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confimation { password }
  end
end
