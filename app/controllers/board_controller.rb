class BoardController < ApplicationController
  load 'othello_board.rb'
  $boards_array = Hash.new

  def new
    @othello_logic = $boards_array[params['game_id']]
    @othello_logic.new_board
    redirect_to "/board/show/#{params['game_id']}"
  end

  def create
    temp_board = OthelloBoard.new(params['game_id'])
    $boards_array[params['game_id']] = temp_board
    redirect_to "/board/show/#{params['game_id']}"
  end

  def show
    @othello_logic = $boards_array[params['id']]
    @board = @othello_logic.get_board
  end

  def switch_board(board_number)
    @board = $boards_array[board_number].get_board
  end

  def update
    piece_place = params
    $boards_array[params['game_id']].place_piece(piece_place['placement_id'][0].to_i,piece_place['placement_id'][1].to_i)
    redirect_to "/board/show/#{params['game_id']}"
  end

  def undo
    $boards_array[params['game_id']].undo_move
    redirect_to "/board/show/#{params['game_id']}"
  end

end
