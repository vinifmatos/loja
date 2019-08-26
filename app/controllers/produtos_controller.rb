class ProdutosController < ApplicationController
  before_action :set_produto, only: :show
  before_action :set_categorias

  layout 'loja'

  # GET /produtos
  # GET /produtos.json
  def index
    if params[:categoria].present?
      if params[:categoria] == 'promocoes'
        @promocoes = Promocao.ativas.includes(:produto).order(created_at: :desc)
        render :promocoes
      else
        @produtos = Produto.where(categoria_id: params[:categoria])
      end
    else
      @produtos = Produto.all
    end
  end

  # GET /produtos/1
  # GET /produtos/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produto
      @produto = Produto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def produto_params
      params.require(:produto).permit(:nome, :descricao, :preco)
    end

    def set_categorias
      @categorias = Categoria.all.select(:id, :nome)
    end
end
