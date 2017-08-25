Rails.application.routes.draw do
  root 'board#board1'
  get '/board1',to:'board#board1'
end
