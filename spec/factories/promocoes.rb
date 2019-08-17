FactoryBot.define do
  factory :promocao do
    produto
    preco { Faker::Commerce.price(range: Range.new(produto.preco * 0.1, produto.preco * 0.8)) }
    validade { Faker::Date.forward(days: 14) }
  end
end
