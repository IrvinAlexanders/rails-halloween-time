Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_for :users
  root to: 'pages#home'

  resources :costumes do
    resources :bookings
    resources :reviews
  end
  resources :bookings, only: [:index, :edit, :update] do
    member do
      get :confirm
    end
  end
end
