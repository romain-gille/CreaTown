Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "index", to: 'pages#index'
  get "creations/new", to: 'creations#new'
  post "creations", to: 'creations#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
