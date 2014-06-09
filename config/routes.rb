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

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

end
