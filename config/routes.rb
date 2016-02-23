Rails.application.routes.draw do

resources :kouens, only: :show do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
  root 'products#index'

devise_for :users

    
  end