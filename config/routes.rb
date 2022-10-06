Rails.application.routes.draw do
  devise_for :users
  resources :halls
  resources :movies
  resources :shows, except: [:edit, :update] do
    resources :reservations, only: [:index, :show, :new, :create] do
      patch 'confirm', on: :member
      patch 'cancel', on: :member
    end
  end
  root to: 'shows#index'
end
