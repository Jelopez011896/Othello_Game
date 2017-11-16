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
    if !$boards_array.key?(params['id'])
      $boards_array[params['id']] = OthelloBoard.new(params['id'])
    end
    @othello_logic = $boards_array[params['id']]
    @board = @othello_logic.get_board
  end


  def update
    piece_place = params
    $boards_array[params['game_id']].place_piece(piece_place['placement_id'][0].to_i,piece_place['placement_id'][1].to_i)
    if !$boards_array[params['game_id']].get_valid_move
      flash[:invalid_move] = "That move was invalid. Try Again"
    end
    redirect_to "/board/show/#{params['game_id']}"
  end

  def undo
    $boards_array[params['game_id']].undo_move
    redirect_to "/board/show/#{params['game_id']}"
  end

end
