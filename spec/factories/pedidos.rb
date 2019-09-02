FactoryBot.define do
  factory :pedido do
    situacao { Pedido.situacoes[:processando] }
    cliente
    carrinho { FactoryBot.create(:carrinho, cliente: cliente) }
    data { Faker::Date.between(from: Date.today, to:7.days.from_now) }
  end
end
