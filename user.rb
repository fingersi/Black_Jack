class User < Players
  attr_reader :nickname

  def turn
    loop do
      puts ''
      puts 'Select action'
      puts 'Skip turn press 1'
      puts 'Add card press 2'
      puts 'Open cards 3'

      choise = gets.chomp.to_i
      case choise
      when 1
        return 'dealer_turn'
      when 2
        return 'player_add_card'
      when 3
        return 'open_cards'
      else
        puts 'Cannot get you.'
      end
    end
  end
end
