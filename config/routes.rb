Rails.application.routes.draw do
  root to: 'families#index'
  resources :families do
    member do
      get 'top'
    end
  end
end
