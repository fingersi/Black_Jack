class Game
  def initialize
    @player = User.new(input_nickname)
    @dealer = Dealer.new
    game
  end

  def game
    loop do
      start_new_round
      puts "Player has #{@player.wins} wins. "
      break if game_ends

      break if play_again
    end
  end

  def check_balance
    return @dealer.nickname if @player.balance <= 0

    return @player.nickname if @dealer.balance <= 0

    false
  end

  def game_ends
    status = check_balance
    if status
      HiScore.add_score({ nickname: @player.nickname, wins: @player.wins })
      puts "Player #{status} totally wins"
      true
    else
      false
    end
  end

  def input_nickname
    puts 'Enter your name'
    nickname = gets.chomp
    puts "nickname #{nickname}"
    nickname
  end

  def play_again
    puts
    puts 'New Round?'
    puts 'Yes, enter 1'
    puts 'No, enter 0'
    input = gets.chomp
    case input
    when '0'
      true
    when '1'
      false
    else
      puts 'Cannot gets you'
    end
  end

  def start_new_round
    Round.new(@player, @dealer)
  end
end
