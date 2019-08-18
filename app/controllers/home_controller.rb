class HomeController < ApplicationController
  before_action :set_categorias, only: :index
  before_action :get_promocoes, only: :index

  def index
  end

  private

  def set_categorias
    @categorias = Categoria.all.select(:id, :nome)
  end

  def get_promocoes
    @promocoes = params[:categoria].present? ? Promocao.where(categoria_id: params[:categoria]).ativas.includes(:produto).order(created_at: :desc).limit(6) : Promocao.ativas.includes(:produto).order(created_at: :desc).limit(6)
  end
end
