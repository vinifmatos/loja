Rails.application.routes.draw do
  devise_for :usuarios
  devise_for :clientes
  namespace :admin do
    get '/', to: 'home#index'
    resources :produtos
    resources :promocoes
    post '/promocao/publicar/:id', to: 'promocoes#publicar', format: [:js, :json], as: 'publicar_promocao'
    post '/promocao/encerrar/:id', to: 'promocoes#publicar', format: [:js, :json], as: 'encerrar_promocao'
  end
  resources :categorias
  root 'home#index'
  resources :produtos, only: [:index, :show]
end
