class Game
  def initialize
    @player = User.new(input_nickname)
    @dealer = Dealer.new
    game
    start_new_game
    play_again
  end

  def game 
    loop do
      start_new_game
      play_again
    end
  end

  def input_nickname
    puts 'Enter your name'
    nickname = gets.chomp
    puts "nickname #{nickname}"
    nickname
  end

  def play_again
    puts 'New Round?'

    puts 'Yes, enter 1'
    puts 'No, enter 0'
    input = gets.chomp
    case input
    when '0'
      send('break')
    end
  end

  def start_new_game
    Round.new(@player, @dealer)
  end
end
