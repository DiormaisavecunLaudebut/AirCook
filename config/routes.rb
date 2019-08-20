Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
   get "dashboard", to: "users#dashboard"
  resources :kitchens do
     
    resources :bookings do
    end
  end
end
