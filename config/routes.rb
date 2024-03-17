Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations' }
  root to: 'users#index'
  resources :users, only: :index
  resources :families do
    member do
      get 'top'
    end
    
    resources :tasks, only: [:new, :create, :index]
    resources :day_tasks, only: [:new, :create, :index, :edit, :update]
  end
end
