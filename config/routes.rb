Rails.application.routes.draw do
  devise_for :users
  resources :halls
  resources :movies
  root "movies#index"
end
