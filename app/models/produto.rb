class Produto < ApplicationRecord
  belongs_to :categoria
  has_many :promocoes
  mount_uploaders :imagens, ImagemProdutoUploader
  # serialize :imagens, JSON

  def thumbnail
    imagens.first.present? ? imagens.first.thumb.url : ImagemProdutoUploader.new.default_url
  end
end
