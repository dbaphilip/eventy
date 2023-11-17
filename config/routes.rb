Rails.application.routes.draw do
  root "events#index"

  resources :events do
    member do
      get :delete
    end
    
    resources :registrations
  end
end