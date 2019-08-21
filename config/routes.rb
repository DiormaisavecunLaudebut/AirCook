Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'lior', to: 'pages#lior'
  get "dashboard", to: "users#dashboard" 
  get "mykitchens", to: "users#mykitchens"
  get "myfavorites", to: "users#myfavorites"
  resources :kitchens do
    resources :bookings do
    end
  end
end
