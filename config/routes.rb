Rails.application.routes.draw do
  devise_for :users
  resources :halls
  resources :movies
  resources :shows, except: [:edit, :update]
  root "movies#index"
end
