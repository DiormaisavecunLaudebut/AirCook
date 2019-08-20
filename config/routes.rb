Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'lior', to: 'pages#lior'
   get "dashboard", to: "users#dashboard"
  resources :kitchens do
    resources :bookings do
    end
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlend
