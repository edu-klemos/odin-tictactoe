class Board

  attr_accessor :grid
  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def space_available?(position_x, position_y)
    self.grid[position_x][position_y].match(" ")#position - 1 to get element right position
  end

  def draw_grid
    grid_string = "\n"
    self.grid.each_with_index do |row, index|
      grid_string << self.print_row(row)
      unless index == 2 then grid_string << "---------\n" end
    end
    grid_string
  end

  private
  def print_row(row)
    row_text = "#{ row[0]} | #{row[1]} | #{row[2]} \n"
  end
end