class HomeController < ApplicationController
  before_action :set_categorias, only: :index

  def index
  end

  private

  def set_categorias
    @categorias = Categoria.all.select(:id, :nome)
  end
end
