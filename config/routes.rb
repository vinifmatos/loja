Rails.application.routes.draw do
  devise_for :usuarios
  devise_for :clientes, controllers: {
    sessions: 'clientes/sessions'
  }

  namespace :admin do
    get '/', to: 'home#index'
    resources :produtos
    resources :promocoes
    resources :categorias
    post '/promocao/publicar/:id', to: 'promocoes#publicar', format: [:js, :json], as: 'publicar_promocao'
    post '/promocao/encerrar/:id', to: 'promocoes#encerrar', format: [:js, :json], as: 'encerrar_promocao'
    scope :configuracoes do
      get 'dadosloja', to: 'dados_loja#show', as: 'dadosloja'
      patch 'dadosloja', to: 'dados_loja#update'
      put 'dadosloja', to: 'dados_loja#update'
      get 'dadosloja/editar', to: 'dados_loja#edit', as: 'edit_dadosloja'
    end
  end

  root 'home#index'
  resources :produtos, only: [:index, :show]
  resource :carrinho, only: [:show]
  scope 'carrinho' do
    post 'removeritens', to: 'carrinhos#remover_itens', as: 'removeritens_carrinho'
    post 'adicionar/:id_produto', to: 'carrinhos#adicionar', as: 'adicionar_carrinho'
    post 'remover/:id_produto', to: 'carrinhos#remover', as: 'remover_carrinho'
    post 'quantidade/', to: 'carrinhos#atualiza_quantidade', as: 'atualiza_quantidade_carrinho'
  end
end
