
class OthelloBoard
  def initialize
    $game_board

  end



  def new_board
    $game_board =   [
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,0,1,2,2,2],
        [2,2,2,1,0,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
      ]
  end

  def place_piece(row,column)
    $game_board[row][column] = 1
    puts 'Piece has been placed'
  end

end
