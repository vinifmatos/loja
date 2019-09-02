FactoryBot.define do
  factory :carrinho do
    cliente

    transient do
      itens_count { 10 }
    end

    after(:create) do |carrinho, evaluator|
      FactoryBot.create_list(:produto_carrinho, evaluator.itens_count, carrinho: carrinho)
    end
  end
end
