module AreaLoja
  extend ActiveSupport::Concern

  included do
    layout 'loja'
    before_action :set_categoria_atual
    before_action :set_categorias, only: :index
    before_action :authenticate_cliente!
    before_action :set_carrinho
  end

  private

  def set_categorias
    @categorias = Categoria.all.select(:id, :nome)
  end

  def set_categoria_atual
    @categoria_atual = params[:categoria]
  end

  def set_carrinho
    if cookies.signed[:id_carrinho].present?
      @carrinho = Carrinho.find(cookies.signed[:id_carrinho])
      @carrinho.update(cliente: current_cliente) if @carrinho.cliente.nil? and cliente_signed_in?
    else
      @carrinho = Carrinho.create(cliente: current_cliente)
    end
    cookies.signed[:id_carrinho] = @carrinho.id
  end
end
