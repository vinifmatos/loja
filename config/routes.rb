Rails.application.routes.draw do
  devise_for :usuarios
  devise_for :clientes
  namespace :admin do
    get '/', to: 'home#index'
    resources :produtos
    resources :promocoes
  end
  resources :categorias
  root 'home#index'
  resources :produtos, only: [:index, :show]
end
