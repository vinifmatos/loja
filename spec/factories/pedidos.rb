FactoryBot.define do
  factory :pedido do
    status { 1 }
    carrinho { nil }
    data { "2019-09-01 20:22:09" }
  end
end
