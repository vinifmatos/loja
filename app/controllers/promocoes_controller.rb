class PromocoesController < ApplicationController
  before_action :set_promocao, only: [:show, :edit, :update, :destroy]

  # GET /promocoes
  # GET /promocoes.json
  def index
    @promocoes = Promocao.all
  end

  # GET /promocoes/1
  # GET /promocoes/1.json
  def show
  end

  # GET /promocoes/new
  def new
    @promocao = Promocao.new
  end

  # GET /promocoes/1/edit
  def edit
  end

  # POST /promocoes
  # POST /promocoes.json
  def create
    @promocao = Promocao.new(promocao_params)

    respond_to do |format|
      if @promocao.save
        format.html { redirect_to @promocao, notice: 'Promocao was successfully created.' }
        format.json { render :show, status: :created, location: @promocao }
      else
        format.html { render :new }
        format.json { render json: @promocao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promocoes/1
  # PATCH/PUT /promocoes/1.json
  def update
    respond_to do |format|
      if @promocao.update(promocao_params)
        format.html { redirect_to @promocao, notice: 'Promocao was successfully updated.' }
        format.json { render :show, status: :ok, location: @promocao }
      else
        format.html { render :edit }
        format.json { render json: @promocao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promocoes/1
  # DELETE /promocoes/1.json
  def destroy
    @promocao.destroy
    respond_to do |format|
      format.html { redirect_to promocoes_url, notice: 'Promocao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promocao
      @promocao = Promocao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promocao_params
      params.require(:promocao).permit(:produto_id, :preco, :preco, :validade)
    end
end
