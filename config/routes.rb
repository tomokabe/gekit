Rails.application.routes.draw do
  devise_for :users
    root  'top#index'
    get '/top' => 'top#index'
    get '/kouens/search' => 'kouens#search' #公演検索
    get '/kouens/:id' => 'kouens#show' #公演詳細画面
    get   '/kouens/:id/review'   =>  'kouens#review' #レビュー一覧
    get   '/kouens/:id/new'  =>  'kouens#new' #レビュー投稿画面
    post  '/kouens'      =>  'kouens#create' #レビュー投稿機能

    
  end