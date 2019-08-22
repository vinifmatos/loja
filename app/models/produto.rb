class Produto < ApplicationRecord
  belongs_to :categoria
  has_many :promocoes
  has_many :imagens, foreign_key: :produto_id, class_name: 'ImagemProduto'
  accepts_nested_attributes_for :imagens, allow_destroy: true

  def thumbnail
    imagens.first.try(:imagem).try(:thumb).try(:url) || ImagemProduto.new.imagem.thumb.url
  end
end
