module AreaLoja
  extend ActiveSupport::Concern

  included do
    include RotinasCarrinho
    layout 'loja'
    before_action :set_categoria_atual
    before_action :set_categorias
    before_action :set_carrinho
  end

  private

  def set_categorias
    @categorias = Categoria.all.select(:id, :nome)
  end

  def set_categoria_atual
    @categoria_atual = params[:categoria]
  end
end
