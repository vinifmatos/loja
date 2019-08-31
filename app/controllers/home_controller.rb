class HomeController < ApplicationController
  include AreaLoja

  before_action :get_promocoes, only: :index
  skip_before_action :set_categorias, except: :index

  def index
  end

  private

  def get_promocoes
    @promocoes = params[:categoria].present? ? Promocao.where(categoria_id: params[:categoria]).ativas.includes(:produto).order(created_at: :desc).limit(6) : Promocao.ativas.includes(:produto).order(created_at: :desc).limit(6)
  end
end
