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
    @carrinho = session[:id_carrinho].present? ? Carrinho.find(session[:id_carrinho]) : Carrinho.create(cliente: current_cliente)
    session[:id_carrinho] = @carrinho.id
  end
end