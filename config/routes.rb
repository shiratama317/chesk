Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'users/invitations' }
  root to: 'users#index'
  resources :users, only: :index
  resources :families do
    member do
      get 'top'
    end
  end
end
