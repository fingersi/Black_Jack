class User < Players
  attr_reader :nickname

  def initialize(cards, nickname)
    super(cards, nickname)
  end

  def turn
    puts ''
    puts 'Select action'
    puts 'Skip turn press 1'
    puts 'Add card press 2'
    puts 'Open cards 3'
    choise = gets.chomp.to_i
    case choise
    when 1
      'dealer_turn'
    when 2
      'player_add_card'
    when 3
      'open_cards'
    end
  end
end
