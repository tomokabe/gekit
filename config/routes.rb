Rails.application.routes.draw do
    get '/top' => 'top#index'
    get '/user'  =>  'user#showreview'
    get '/kouen' => 'kouen#index'
  end