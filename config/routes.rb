Rails.application.routes.draw do
  devise_for :users
  root to: 'families#index'
  resources :families do
    member do
      get 'top'
    end
  end
end
