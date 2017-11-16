Rails.application.routes.draw do

  root 'board#home'

  get 'board/new',to:'board#new'
  get 'board/create',to:'board#create'
  get 'board/show/:id', to:'board#show'
  get 'board/update/:id',to:'board#update'
  get 'board/undo',to:'board#undo'
  get '/board',to:'board#home'

  post 'board/show/:id', to:'board#show'
  post 'board/new',to:'board#new'
  post 'board/create',to:'board#create'
  post 'board/update/:id',to:'board#update'
  post 'board/undo', to:'board#undo'

  match "*path" => "board#home", via: [:get, :post]
end
