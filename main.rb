require_relative 'lib/game.rb'
require_relative 'lib/io_handler.rb'

game = Game.new

player1_name = IOHandler::get_valid_player_name 1
player2_name = IOHandler::get_valid_player_name 2

game.create_player player1_name
game.create_player player2_name


puts "\nGame start!\n"
loop do 
  game.print_board
  puts "\n#{game.current_player_name} turn"
  position_x = IOHandler::valid_number_input is_row=true
  position_y = IOHandler::valid_number_input is_row=false
  
  if game.is_position_playable? position_x, position_y
    game.play_turn position_x, position_y
    break if game.check_win
    game.change_turn
  else
    puts "Space has a piece already"
  end
  break if game.verify_draw
end
game.print_board
puts game.winner_message


