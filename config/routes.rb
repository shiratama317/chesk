Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }
  root to: 'users#show'
  resources :families do
    member do
      get 'top'
    end
    
    member do
      delete 'withdraw'
    end
    
    resources :tasks, only: [:new, :create, :index]
    resources :day_tasks, only: [:new, :create, :index, :edit, :update]
  end
  
  resources :users, only: :destroy
  resources :tasks, only: [:edit, :update, :destroy]
  resources :day_tasks, only: [:show, :destroy]
end
