Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'lior', to: 'pages#lior'
  get "dashboard", to: "users#dashboard"
  get "mykitchens", to: "users#mykitchens"
  get "myfavorites", to: "users#myfavorites"
  resources :kitchens do
    get "like", to: "kitchens#like"
    delete "dislike", to: "kitchens#dislike"
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:destroy] do
    patch "accept", to: "users#accept"
    patch "decline", to: "users#decline"
  end
end
