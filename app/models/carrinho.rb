class Carrinho < ApplicationRecord
  belongs_to :cliente, optional: true
end
