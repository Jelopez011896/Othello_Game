Rails.application.routes.draw do
  root 'board#home'
  get '/new',to:'board#new'
  get '/board',to:'board#board'
  post '/new',to:'board#new'
  post '/board',to:'board#board'
  post '/update',to:'board#update'
  patch 'update', to:'board#update'
end
