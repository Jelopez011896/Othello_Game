
class OthelloBoard

  #initialize method sets up certain global variables specific to this class
  #that will keep track of neccessary functions
  def initialize
    @game_board =[
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,0,1,2,2,2],
        [2,2,2,1,0,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
      ]
    @prev_board = []
    @player_turn = "white"
    @black_count = 2
    @white_count = 2
    @valid_move = true
  end

  def new_board
    @game_board =   [
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,0,1,2,2,2],
        [2,2,2,1,0,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
        [2,2,2,2,2,2,2,2],
      ]
      @player_turn = "white"
      @black_count = 2
      @white_count = 2
      @valid_move = true
      @prev_move = []
  end

  def get_board
    return @game_board
  end

  def get_turn
    return @player_turn
  end

  def get_tile_count
    return @white_count,@black_count
  end

  def get_valid_move
    return @valid_move
  end

  def undo_move
#Undo the most recent move from the game
#Array of moves has format: Board,white_count,black_count,player_turn
    if @prev_board.length > 0
      @game_board = @prev_board[-1][0]
      @white_count = @prev_board[-1][1]
      @black_count = @prev_board[-1][2]
      @player_turn = @prev_board[-1][3]
      @prev_board.pop
    end
  end

  def place_piece(row,column)
    switch_tiles(row,column)
  end

  def switch_tiles(row,column)
    switch_direction = check_spot(row,column)
    cur_board  = []
    @game_board.each do |piece|
      cur_board.push(piece.dup)
    end
    previous_move = [cur_board,@white_count,@black_count,@player_turn]
    @prev_board.push(previous_move)
    if !switch_direction.empty? && @game_board[row][column]== 2
      switch_direction.each do |direction|
        case direction
        when "up"
          switch_Up(row,column)
         when "upl"
           switch_UpL(row,column)
         when "upr"
           switch_UpR(row,column)
         when "l"
           switch_L(row,column)
          when "r"
            switch_R(row,column)
          when "down"
            switch_Down(row,column)
          when "downl"
            switch_DownL(row,column)
          when "downr"
            switch_DownR(row,column)
          end
      end
      if @player_turn == "white"
        @player_turn = "black"
      elsif @player_turn == "black"
        @player_turn = "white"
      end
      @valid_move = true
    else
      @valid_move = false
    end
  end

  def check_spot(row,column)
    #array.push will add new elements to an array
    switch_directions = []
    if check_up(row,column)
      switch_directions.push("up");
    end
    if check_upl(row,column)
      switch_directions.push("upl");
    end
    if check_upr(row,column)
      switch_directions.push("upr");
    end
    if check_r(row,column)
      switch_directions.push("r");
    end
    if check_l(row,column)
      switch_directions.push("l");
    end
    if check_down(row,column)
      switch_directions.push("down");
    end
    if check_downr(row,column)
      switch_directions.push("downr");
    end
    if check_downl(row,column)
      switch_directions.push("downl");
    end

    return switch_directions;
  end
#-------------------------------------------------------------------------------------------
# Check statements check in 8 directions to check if the current place is a valid piece placement
  def check_up(row,column)
    tempr = row-1
    while row>-1
      if @player_turn=="white"
        if @game_board[row][column] == 0
          if row<tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row<=tempr
          return false
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1
          if row<tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row<=tempr
          return false
        end
      end
      row-=1
    end
      return false
  end

  def check_upl(row,column)
    tempr = row-1
    while row>-1 && column>-1
      if @player_turn=="white"
        if @game_board[row][column] == 0
          if row<tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row<=tempr
          return false
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1
          if row<tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row<=tempr
          return false
        end
      end
      row-=1
      column-=1
    end
      return false
  end

  def check_upr(row,column)
    tempr = row-1
    while row>-1 && column<8
      if @player_turn=="white"
        if @game_board[row][column] == 0
          if row<tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row<=tempr
          return false
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1
          if row<tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row<=tempr
          return false
        end
      end
      row-=1
      column+=1
    end
      return false
  end

  def check_r(row,column)
    templ = column+1
    while column<8
      if @player_turn=="white"
        if @game_board[row][column] == 0
          if column>templ
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && column>=templ
          return false
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1
          if column>templ
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && column>=templ
          return false
        end
      end
      column+=1
    end
      return false
  end

  def check_down(row,column)
    tempr = row+1
    while row<8
      if @player_turn=="white"
        if @game_board[row][column] == 0
          if row>tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row>=tempr
          return false
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1
          if row>tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row>=tempr
          return false
        end
      end
      row+=1
    end
      return false
  end

  def check_downl(row,column)
    tempr = row+1
    while row<8 && column>-1
      if @player_turn=="white"
        if @game_board[row][column] == 0
          if row>tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row>=tempr
          return false
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1
          if row>tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row>=tempr
          return false
        end
      end
      row+=1
      column-=1
    end
      return false
  end

  def check_downr(row,column)
    tempr = row+1
    while row<8 && column<8
      if @player_turn=="white"
        if @game_board[row][column] == 0
          if row>tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row>=tempr
          return false
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1
          if row>tempr
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && row>=tempr
          return false
        end
      end
      row+=1
      column+=1
    end
      return false
  end

  def check_l(row,column)
    templ = column-1
    while column>-1
      if @player_turn=="white"
        if @game_board[row][column] == 0
          if column<templ
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && column<=templ
          return false
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1
          if column<templ
            return true
          else
            return false
          end
        elsif @game_board[row][column] == 2 && column<=templ
          return false
        end
      end
      column-=1
    end
      return false
  end
#---------------------------------------------------------------------------------------------------
# These are the switch functions that switch the tiles in the direction that the check statements
# specified were valid directions

  def switch_Up(row,column)
    tempr = row-1
    while row>-1
      if @player_turn== "white"
        if @game_board[row][column] == 0 && row<tempr
          break
        elsif @game_board[row][column] == 1
          @game_board[row][column] = 0
          @white_count+=1
          @black_count-=1
        end
        if @game_board[row][column]!=0
          @game_board[row][column]= 0
          @white_count+=1
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1 && row<tempr
          break
        elsif @game_board[row][column] == 0
          @game_board[row][column] = 1
          @white_count-=1
          @black_count+=1
        end
        if @game_board[row][column]!= 1
          @game_board[row][column]= 1
          @black_count+=1
        end
      end
      row-=1
    end
  end

  def switch_UpR(row,column)
    tempr = row-1
    while row>-1 && column<8
      if @player_turn== "white"
        if @game_board[row][column] == 0 && row<tempr
          break
        elsif @game_board[row][column] == 1
          @game_board[row][column] = 0
          @white_count+=1
          @black_count-=1
        end
        if @game_board[row][column]!=0
          @game_board[row][column]= 0
          @white_count+=1
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1 && row<tempr
          break
        elsif @game_board[row][column] == 0
          @game_board[row][column] = 1
          @white_count-=1
          @black_count+=1
        end
        if @game_board[row][column]!= 1
          @game_board[row][column]= 1
          @black_count+=1
        end
      end
      row-=1
      column+=1
    end
  end

  def switch_UpL(row,column)
    tempr = row-1
    while row>-1 &&column>-1
      if @player_turn== "white"
        if @game_board[row][column] == 0 && row<tempr
          break
        elsif @game_board[row][column] == 1
          @game_board[row][column] = 0
          @white_count+=1
          @black_count-=1
        end
        if @game_board[row][column]!=0
          @game_board[row][column]= 0
          @white_count+=1
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1 && row<tempr
          break
        elsif @game_board[row][column] == 0
          @game_board[row][column] = 1
          @white_count-=1
          @black_count+=1
        end
        if @game_board[row][column]!= 1
          @game_board[row][column]= 1
          @black_count+=1
        end
      end
      row-=1
      column-=1
    end
  end

  def switch_L(row,column)
    templ = column-1
    while column>-1
      if @player_turn== "white"
        if @game_board[row][column] == 0 && column<templ
          break
        elsif @game_board[row][column] == 1
          @game_board[row][column] = 0
          @white_count+=1
          @black_count-=1
        end
        if @game_board[row][column]!=0
          @game_board[row][column]= 0
          @white_count+=1
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1 && column<templ
          break
        elsif @game_board[row][column] == 0
          @game_board[row][column] = 1
          @white_count-=1
          @black_count+=1
        end
        if @game_board[row][column]!= 1
          @game_board[row][column]= 1
          @black_count+=1
        end
      end
      column-=1
    end
  end

  def switch_R(row,column)
    templ = column+1
    while column<8
      if @player_turn== "white"
        if @game_board[row][column] == 0 && column>templ
          break
        elsif @game_board[row][column] == 1
          @game_board[row][column] = 0
          @white_count+=1
          @black_count-=1
        end
        if @game_board[row][column]!=0
          @game_board[row][column]= 0
          @white_count+=1
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1 && column>templ
          break
        elsif @game_board[row][column] == 0
          @game_board[row][column] = 1
          @white_count-=1
          @black_count+=1
        end
        if @game_board[row][column]!= 1
          @game_board[row][column]= 1
          @black_count+=1
        end
      end
      column+=1
    end
  end

  def switch_Down(row,column)
    tempr = row+1
    while row<8
      if @player_turn== "white"
        if @game_board[row][column] == 0 && row>tempr
          break
        elsif @game_board[row][column] == 1
          @game_board[row][column] = 0
          @white_count+=1
          @black_count-=1
        end
        if @game_board[row][column]!=0
          @game_board[row][column]= 0
          @white_count+=1
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1 && row>tempr
          break
        elsif @game_board[row][column] == 0
          @game_board[row][column] = 1
          @white_count-=1
          @black_count+=1
        end
        if @game_board[row][column]!= 1
          @game_board[row][column]= 1
          @black_count+=1
        end
      end
      row+=1
    end
  end

  def switch_DownL(row,column)
    tempr = row+1
    while row<8 && column>-1
      if @player_turn== "white"
        if @game_board[row][column] == 0 && row>tempr
          break
        elsif @game_board[row][column] == 1
          @game_board[row][column] = 0
          @white_count+=1
          @black_count-=1
        end
        if @game_board[row][column]!=0
          @game_board[row][column]= 0
          @white_count+=1
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1 && row>tempr
          break
        elsif @game_board[row][column] == 0
          @game_board[row][column] = 1
          @white_count-=1
          @black_count+=1
        end
        if @game_board[row][column]!= 1
          @game_board[row][column]= 1
          @black_count+=1
        end
      end
      row+=1
      column-=1
    end
  end

  def switch_DownR(row,column)
    tempr = row+1
    while row<8 && column<8
      if @player_turn== "white"
        if @game_board[row][column] == 0 && row>tempr
          break
        elsif @game_board[row][column] == 1
          @game_board[row][column] = 0
          @white_count+=1
          @black_count-=1
        end
        if @game_board[row][column]!=0
          @game_board[row][column]= 0
          @white_count+=1
        end
      elsif @player_turn == "black"
        if @game_board[row][column] == 1 && row>tempr
          break
        elsif @game_board[row][column] == 0
          @game_board[row][column] = 1
          @white_count-=1
          @black_count+=1
        end
        if @game_board[row][column]!= 1
          @game_board[row][column]= 1
          @black_count+=1
        end
      end
      row+=1
      column+=1
    end
  end

end
