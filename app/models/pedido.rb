class Pedido < ApplicationRecord
  belongs_to :carrinho
  before_create :set_valor
  before_create :set_data
  before_create :set_situacao

  enum situacoes: [:processando, :aguardando_pagamento, :separacao_produtos, :nota_fiscal_emitida, :em_transporte, :concluido]

  def itens
    carrinho.itens
  end

  def cliente
    carrinho.cliente
  end

  private

  def set_valor
    self.valor = itens.map(&:valor_total).reduce(:+)
  end

  def set_data
    self.data = Time.now
  end

  def set_situacao
    self.situacao = self.class.situacoes[:processando]
  end
end
