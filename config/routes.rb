Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/main", to: "pages#main"
  resources :creations, only: [:show, :new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'mycreations', to: 'dashboard#mycreations'
  get 'likedcreations', to: 'dashboard#likedcreations'
  get 'myevents', to: 'dashboard#myevents'
  get 'attendedevents', to: 'dashboard#attendedevents'
end
