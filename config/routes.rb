Rails.application.routes.draw do
  devise_for :usuarios
  devise_for :clientes
  namespace :admin do
    get '/', to: 'home#index'
    resources :produtos
    resources :promocoes
    post '/promocao/:id/publicar', to: 'promocoes#publicar', format: [:js, :json], as: 'publicar_promocao'
    post '/promocao/:id/encerrar', to: 'promocoes#publicar', format: [:js, :json], as: 'encerrar_promocao'
  end
  resources :categorias
  root 'home#index'
  resources :produtos, only: [:index, :show]
end
