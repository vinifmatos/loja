class Carrinho < ApplicationRecord
  belongs_to :cliente, optional: true
  has_many :itens, foreign_key: :carrinho_id, class_name: 'ProdutoCarrinho', inverse_of: :carrinho
  has_many :produtos, through: :itens

  def adicionar_produto(id_produto)
    if itens.where(produto_id: id_produto).empty?
      itens << ProdutoCarrinho.new(produto_id: id_produto)
    else
      produto = itens.find_by(produto_id: id_produto)
      produto.quantidade += 1
      produto.save
    end
  end

  def remover_produto(id_produto)
    item = itens.find_by(produto_id: id_produto)
    itens.destroy item
  end

  def atualiza_quantidade(item_carrino)
    item = itens.find(item_carrino[:id])
    item.quantidade = item_carrino[:quantidade]
    item.save
  end
end
