module IOHandler
  def self.get_valid_player_name(player_number)
    player_name = ""
    output_string = self.output_string_name(player_number)
    loop do
      print output_string
      player_name = gets.chomp
      break unless player_name.empty?
      puts "Name can't be empty\n\n"
    end
    player_name
  end

  def self.valid_number_input(is_row)
    position = ""
    output_string = self.output_string_position(is_row)
    loop do
      print output_string
      position = gets.chomp
      break if self.valid_number? position
      puts "You must choose a number between 1 and 3"
    end
    position.to_i - 1
  end

  private_class_method def self.output_string_name(player_number)
    if player_number == 1
      "Player 1(X) Name: "
    else 
      "Player 2(O) Name: "
    end
  end

  private_class_method def self.output_string_position(is_row)
    if is_row
      "Select a row (1,2,3) to play: "
    else 
      "Select a column (1,2,3) to play: "
    end
  end

  private_class_method def self.valid_number?(position_string)
    if position_string.scan(/^\d+$/).any? #check if string only contain numbers
      position_string.to_i > 0 && position_string.to_i < 4
    end
  end
end