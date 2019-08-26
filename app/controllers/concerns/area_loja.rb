module AreaLoja
  extend ActiveSupport::Concern

  included do 
    layout 'loja'
    before_action :set_categoria_atual
    before_action :set_categorias, only: :index
  end

  private

  def set_categorias
    @categorias = Categoria.all.select(:id, :nome)
  end

  def set_categoria_atual
    @categoria_atual = params[:categoria]
  end
end