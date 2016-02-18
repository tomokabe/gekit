Rails.application.routes.draw do
    root  'top#index'
    get '/top' => 'top#index'
    get '/user'  =>  'user#showreview'
    get '/kouen' => 'kouen#index'
    get '/search' => 'search#index'
    get   'users/:id'   =>  'users#show'   
  end