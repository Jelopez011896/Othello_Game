Rails.application.routes.draw do
  root 'board#home'
  get '/board1',to:'board#board1'
  post '/board1',to:'board#board1'
  post 'update', to:'board#update'
end
