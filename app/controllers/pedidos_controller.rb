class PedidosController < ApplicationController
  before_action :authenticate_cliente!

  def index
    @pedidos = current_cliente.pedidos
  end

  def new
    @pedido = Pedido.new
    @pedido.carrinho = RotinasCarrinho.get_carrinho
  end
end
