class CarrinhosController < ApplicationController
  include AreaLoja

  skip_before_action :set_categorias, except: :show
  # before_action :authenticate_cliente!, only: [:adicionar, :remover_itens]

  def show
  end

  def remover_itens
    respond_to do |format|
      if @carrinho.itens.destroy_all
        format.html { redirect_to carrinho_path, notice: 'Produtos removidos com sucesso' }
        format.json { render :show, status: :ok, location: @carrinho }
      else
        format.html { render :show }
        format.json { render json: @carrinho.errors, status: :unprocessable_entity }
      end
    end
  end

  def adicionar
    respond_to do |format|
      if @carrinho.adicionar_produto params[:id_produto]
        format.html { redirect_to carrinho_path, notice: 'Produto adicionado com sucesso' }
        format.json { render :show, status: :ok, location: @carrinho }
      else
        format.html { render :show }
        format.json { render json: @carrinho.errors, status: :unprocessable_entity }
      end
    end
  end

  def remover
    respond_to do |format|
      if @carrinho.remover_produto params[:id_produto]
        format.html { redirect_to carrinho_path, notice: 'Produto adicionado com sucesso' }
        format.json { render :show, status: :ok, location: @carrinho }
      else
        format.html { render :show }
        format.json { render json: @carrinho.errors, status: :unprocessable_entity }
      end
    end
  end
end
