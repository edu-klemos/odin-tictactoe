class Player
  @@x_piece = true

  attr_reader :name, :piece
  def initialize(name)
    @name = name
    @piece = Player.return_piece
    @@x_piece = !@@x_piece
  end

  def play(position_x, position_y, board_grid)
    board_grid[position_x, position_y] = self.piece
  end

  private 
  def self.return_piece
    if @@x_piece then "X" else "O" end
  end

end