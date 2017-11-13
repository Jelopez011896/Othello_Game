Rails.application.routes.draw do
  get 'users/new'

  root 'board#home'
  get '/board/new',to:'board#new'
  get '/board',to:'board#board'
  post '/board/new',to:'board#new'
  post '/board',to:'board#board'
  post '/board/update',to:'board#update'
  post '/board/undo', to:'board#undo'
end
