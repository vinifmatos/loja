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
    @promocoes = Promocao.all.ativas.includes(:produto).order(created_at: :desc).limit(6)
  end
end
