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

  root 'users#index'

end
