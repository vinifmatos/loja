# frozen_string_literal: true

class Clientes::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    if cookies.signed[:id_carrinho].present?
      begin
        @carrinho = Carrinho.find(cookies.signed[:id_carrinho])
        @carrinho.update(cliente: current_cliente) if @carrinho.cliente.nil? and cliente_signed_in?
      rescue ActiveRecord::RecordNotFound
        @carrinho = Carrinho.create(cliente: current_cliente)
      end
    else
      @carrinho = Carrinho.create(cliente: current_cliente)
    end
    cookies.signed[:id_carrinho] = @carrinho.id
  end

  # DELETE /resource/sign_out
  def destroy
    super
    cookies.delete :id_carrinho
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
