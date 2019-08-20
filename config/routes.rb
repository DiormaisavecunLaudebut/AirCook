Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :kitchens do
    resources :bookings
    collection do
      get "dashboard"
    end
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htmlend
