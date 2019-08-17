FactoryBot.define do
  factory :categoria do
    nome { Faker::Commerce.department }
  end
end
