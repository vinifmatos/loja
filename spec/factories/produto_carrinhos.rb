FactoryBot.define do
  factory :produto_carrinho do
    carrinho
    produto
    quantidade { Faker::Number.between(from: 1, to: 10) }
  end
end
