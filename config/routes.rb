Rails.application.routes.draw do
  namespace :admin do
    get '/', to: 'home#index'
    resources :produtos
  end
  resources :promocoes
  resources :categorias
  root 'home#index'
  resources :produtos, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
