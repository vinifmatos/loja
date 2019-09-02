FactoryBot.define do
  factory :cliente do
    email { Faker::Internet.email(name: "#{Faker::Name.first_name}#{Faker::Number.between(from: 1, to: 99)}") }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
