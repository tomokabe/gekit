Rails.application.routes.draw do
  devise_for :users
  resources :users, only: :show
  root 'top#index'
  get 'top' => 'top#index'
  get 'top/now' => 'top#now'
  resources :kouens, only: [:show, :create] do
    resources :reviews, only: [:new, :create]
    collection do
      get 'search'
    end
  end
end