Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'lior', to: 'pages#lior'
   get "dashboard", to: "users#dashboard"
<<<<<<< HEAD
  resources :kitchens do   
=======
  resources :kitchens do

>>>>>>> 4936f7f1409d7b38222d8741a2cf36fcc7017d39
    resources :bookings do
    end
  end
end
