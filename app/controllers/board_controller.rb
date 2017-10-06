class BoardController < ApplicationController
  def index
    $game_board = game_board.new
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

  def new
    @board1 = board1.new
  end

  def create
  end

  def edit
  end

  def show
  end

  def update
    $game_board[1][1]=2
    puts "Ye boi"
    redirect_to '/board1'
  end
  def destroy

  end
end
