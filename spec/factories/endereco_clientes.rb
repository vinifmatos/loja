FactoryBot.define do
  factory :endereco_cliente do
    cep { Faker::Address.postcode.remove '-' }
    logradouro { Faker::Address.street_name }
    numero { Faker::Address.building_number }
    bairro { Faker::Address.community }
    cidade { Faker::Address.city }
    complemento { Faker::Address.secondary_address }
    cliente
  end
end
