class Carrinho < ApplicationRecord
  belongs_to :cliente, optional: true
  has_many :itens, foreign_key: :carrinho_id, class_name: 'ProdutoCarrinho', inverse_of: :carrinho
  has_many :produtos, through: :itens
end
