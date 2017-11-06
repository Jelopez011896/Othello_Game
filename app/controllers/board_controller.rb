class BoardController < ApplicationController
    load 'othello_board.rb'

  def board
    @board = OthelloBoard.new
    @game1 = @board.new_board
  end

  def update
    puts "Ye boi"
    redirect_to '/board'
  end
  def destroy

  end
end
