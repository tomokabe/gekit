Rails.application.routes.draw do
  devise_for :users

  resources :kouens, only: [:show, :create] do
    resources :reviews, only: [:new, :create, :show]
    collection do
      get 'search'
    end
  end
  root 'top#index'

  get 'top' => 'top#index'
  get 'top/now' => 'top#now'

end