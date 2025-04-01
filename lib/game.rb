require_relative 'board.rb'
require_relative 'player.rb'

class Game
  MAX_TURNS = 9

  attr_writer :board
  attr_reader :turns

  def initialize
    @players = []
    @board = Board.new
    @player_turn = 0
    @turns = 0
  end

  def create_player(name)
    @players << Player.new(name)
  end

  def current_player_name
    @players[@player_turn].name
  end

  def current_player_piece
    @players[@player_turn].piece
  end


  def play_turn(position_x, position_y)
    current_player = @players[@player_turn]
    @board.grid[position_x][position_y] = current_player.piece
  end

  def change_turn
    @player_turn = 1 - @player_turn #changes player_turn 0 to 1 and vice versa
    @turns+=1
  end

  def is_position_playable?(position_x, position_y)
    @board.space_available? position_x, position_y
  end

  def print_board
    puts @board.draw_grid
  end

  def check_win
    check_lines || check_columns || check_diagonals
  end

  def verify_draw
    @turns == MAX_TURNS
  end

  def winner_message
    if self.verify_draw
     return "It's a draw"
    end
    "\n#{current_player_name} wins!!\n"
  end

  private
  def check_lines
    @board.grid.each do |row|
      if row.uniq.join == current_player_piece then return true end
    end
    return false
  end

  def check_columns
    transposed_grid = @board.grid.transpose
    transposed_grid.each do |column|
      if column.uniq.join == current_player_piece then return true end
    end
    return false
  end

  def check_diagonals
    first_diagonal = [@board.grid[0][0], @board.grid[1][1], @board.grid[2][2]]
    if first_diagonal.uniq.join == current_player_piece then return true end
    second_diagonal = [@board.grid[0][2], @board.grid[1][1], @board.grid[2][0]]
    if second_diagonal.uniq.join == current_player_piece then return true end
    return false
  end

end
