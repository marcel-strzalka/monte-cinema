Rails.application.routes.draw do
  devise_for :users
  resources :halls
  resources :movies
  resources :shows
  root "movies#index"
end
