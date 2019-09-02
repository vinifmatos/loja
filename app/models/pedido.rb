class Pedido < ApplicationRecord
  belongs_to :carrinho
  belongs_to :cliente
  before_create :set_valor
  before_create :set_data
  before_create :set_situacao
  before_create :set_cliente

  enum situacoes: [:processando, :aguardando_pagamento, :separacao_produtos, :nota_fiscal_emitida, :em_transporte, :concluido]

  def itens
    carrinho.itens
  end

  def cliente
    carrinho.cliente
  end

  def t_situacao
    Pedido.human_enum_name :situacoes, Pedido.situacoes.key(self.situacao)
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

  def set_cliente
    self.cliente = carrinho.cliente
  end
end
