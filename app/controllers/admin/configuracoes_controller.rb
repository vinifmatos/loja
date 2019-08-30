class Admin::ConfiguracoesController < Admin::AdminController
  before_action :set_configuracao

  def dados_loja
  end

  def edit
  end

  def update
    respond_to do |format|
      if @configuracao.update(configuracao_params)
        format.html { redirect_to admin_dados_loja_path, notice: 'successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @produto.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_configuracao
    @configuracao = Configuracao.first
  end

  def configuracao_params
    params.require(:configuracao).permit(:nome)
  end
end
