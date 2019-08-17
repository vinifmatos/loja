FactoryBot.define do
  factory :produto do
    nome { Faker::Commerce.product_name }
    descricao { Faker::Commerce.material }
    preco { Faker::Commerce.price }
    categoria
  end
end
