Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/main", to: "pages#main"
  get "/map", to: "pages#map"
  resources :events, only: [:show, :new, :create] do
    resources :participations, only: [:create]
  end
  resources :creations, only: [:show, :new, :create] do
    resources :likes, only: [:create]
  end
  resources :likes, only: [:destroy]
  resources :participations, only: [:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'mycreations', to: 'dashboard#mycreations'
  get 'likedcreations', to: 'dashboard#likedcreations'
  get 'myevents', to: 'dashboard#myevents'
  get 'attendedevents', to: 'dashboard#attendedevents'
  resources :chatrooms, only: %i[index show create] do
    resources :messages, only: :create
  end
end
