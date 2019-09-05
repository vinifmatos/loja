module RotinasCarrinho
  extend ActiveSupport::Concern

  included do
    before_action :set_carrinho
  end

  private

  def set_carrinho
    if cookies.signed[:id_carrinho].present?
      begin
        @carrinho = Carrinho.find(cookies.signed[:id_carrinho])
        @carrinho.update(cliente: current_cliente) if @carrinho.cliente.nil? and cliente_signed_in?
      rescue ActiveRecord::RecordNotFound
        @carrinho = Carrinho.create(cliente: current_cliente)
      end
    else
      @carrinho = Carrinho.create(cliente: current_cliente)
    end
    cookies.signed[:id_carrinho] = { value: @carrinho.id, expires: 6.hour }
  end

  def get_carrinho
    Carrinho.find(cookies.signed[:id_carrinho])
  end
end
