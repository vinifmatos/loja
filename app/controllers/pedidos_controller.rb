class PedidosController < ApplicationController
  include RotinasCarrinho

  before_action :authenticate_cliente!

  def index
    @pedidos = current_cliente.pedidos
  end

  def new
    @pedido = Pedido.new carrinho: get_carrinho
    
  end

  private

  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  def pedidos_params
    params.require(:pedido).permit(:carrinho_id, :descricao, :preco, endereco_cliente: [:cep, :logradouro, :bairro, :cidade, :numero, :complemento])
  end
end
