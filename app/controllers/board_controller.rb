class BoardController < ApplicationController
    load 'othello_board.rb'
    $board = OthelloBoard.new

  def new
    $board.new_board
    $game1 = $board.get_board
    redirect_to '/board'
  end

  def board
  end

  def update
    piece_place = params
    $board.place_piece(piece_place['placement_id'][0].to_i,piece_place['placement_id'][1].to_i)
    redirect_to '/board'
  end

  def destroy

  end
end
