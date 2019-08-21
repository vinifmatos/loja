class ImagemProduto < ApplicationRecord
  belongs_to :produto
  mount_uploader :imagem, ImagemProdutoUploader
end
