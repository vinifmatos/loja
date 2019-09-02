class ProdutoCarrinho < ApplicationRecord
  belongs_to :carrinho
  belongs_to :produto
  before_create :set_valor_unitario

  def valor_total
    quantidade * valor_unitario
  end

  private

  def set_valor_unitario
    self.valor_unitario = produto.preco_com_desconto
  end
end
