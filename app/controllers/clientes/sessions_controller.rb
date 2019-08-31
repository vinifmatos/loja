# frozen_string_literal: true

class Clientes::SessionsController < Devise::SessionsController
  include RotinasCarrinho

  skip_before_action :set_carrinho
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    set_carrinho
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
