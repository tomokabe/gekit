Rails.application.routes.draw do
  devise_for :users
  root 'top#index'
  get 'top' => 'top#index'
  resources :kouens, only: [:show, :create] do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end