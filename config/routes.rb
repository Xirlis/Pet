Rails.application.routes.draw do
  devise_for :users

  get "download", to: "atendimentos#download"
  get "preview", to: "atendimentos#preview"

  root 'home#index'
  resources :atendimentos
  resources :animals
  resources :veterinarios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
