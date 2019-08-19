class Produto < ApplicationRecord
  belongs_to :categoria
  has_many :promocoes
  mount_uploaders :imagens, ImagemProdutoUploader
  serialize :imagens, JSON
end
