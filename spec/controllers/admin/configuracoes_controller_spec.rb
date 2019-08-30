require 'rails_helper'

RSpec.describe Admin::ConfiguracoesController, type: :controller do

  describe "GET #dados_loja" do
    it "returns http success" do
      get :dados_loja
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit_dados_loja" do
    it "returns http success" do
      get :edit_dados_loja
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update_dados_loja" do
    it "returns http success" do
      get :update_dados_loja
      expect(response).to have_http_status(:success)
    end
  end

end
