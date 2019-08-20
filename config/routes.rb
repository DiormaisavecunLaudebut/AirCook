Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :kitchens do
    resources :booking do
      dashboardview
    collection do
      get "dashboard"
    end
  end

  end
 
end
