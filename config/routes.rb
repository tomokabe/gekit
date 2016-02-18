Rails.application.routes.draw do
  devise_for :users
    root  'top#index'
    get '/top' => 'top#index'
    get '/user'  =>  'user#showreview'
    get 'kouens/:id' => 'kouens#show'
    get '/search' => 'search#index'
    get   'users/:id'   =>  'users#show'   
  end