class PedidosController < ApplicationController
  before_action :authenticate_cliente!

  def index
    @pedidos = current_cliente.pedidos
  end
end
