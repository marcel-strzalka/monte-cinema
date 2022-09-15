Rails.application.routes.draw do
  devise_for :users
  resources :cinema_halls
  resources :movies
  root "movies#index"
end
