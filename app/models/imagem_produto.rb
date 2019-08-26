class ImagemProduto < ApplicationRecord
  belongs_to :produto
  mount_uploader :imagem, ImagemProdutoUploader

  def url
    self.imagem.url
  end

  def url_thumb
    self.imagem.thumb.url
  end
end
