class Admin::DadosLojaController < Admin::AdminController
  before_action :set_configuracao
  
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @configuracao.update(dados_loja_params)
        format.html { redirect_to admin_dadosloja_path, notice: 'successfully updated.' }
        format.json { render :show, status: :created, location: admin_dadosloja_path }
      else
        format.html { render :edit }
        format.json { render json: @configuracao.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def dados_loja_params
    params.require(:configuracao).permit(:nome_loja, :telefone_loja, :email_loja)
  end

  def set_configuracao
    @configuracao = Configuracao.first
  end
end
