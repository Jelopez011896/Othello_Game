Rails.application.routes.draw do
  root 'board#home'
  get '/board',to:'board#board'
  post '/board',to:'board#board'
  post '/update',to:'board#update'
  patch 'update', to:'board#update'
end
