Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'home#index'
    resources :produtos
    resources :promocoes
  end
  resources :categorias
  root 'home#index'
  resources :produtos, only: [:index, :show]
end
