class Produto < ApplicationRecord
  belongs_to :categoria
  has_many :promocoes
  has_many :imagens, foreign_key: :produto_id, class_name: 'ImagemProduto'
end
