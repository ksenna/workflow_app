Rails.application.routes.draw do
  
  get 'login' => 'sessions#new'
  get 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  
  resources :users do
    get 'dashboard'
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :assignments do
    resources :submissions
  end
  
  resources :comments

  resources :locations
  resources :courses
  resources :cohorts
  resources :admissions

  root 'users#index'


  get '/auth/facebook', to: 'auth#facebook'
  # get 'auth/facebook/callback', to: 'sessions#create'

  # match 'auth/facebook/callback', to: 'sessions#create', via: [:get, :post]
  # match 'auth/failure', to: redirect('/'), via: [:get, :post]
  # match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
