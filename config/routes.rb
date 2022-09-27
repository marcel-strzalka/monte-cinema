Rails.application.routes.draw do
  devise_for :users
  resources :halls
  resources :movies
  resources :shows, except: [:edit, :update] do
    resources :reservations, only: [:show, :new, :create] do
      put 'confirm', on: :member
      delete 'cancel', on: :member
    end
  end
  root 'movies#index'
end
