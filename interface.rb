class Interface
  include Draw

  STATUS = %i[player_turn dealer_turn].freeze

  ROUND_STATUS = %i[player_win dealer_win tie].freeze

  GAME_STATUS = %i[player_wins dealer_wins].freeze

  def initialize
    @game = Game.new(input_nickname)
    round
  end

  def game_ends?
    return true unless @game.winner.nil?

    @game.game_ends?
  end

  def round_ends?
    @game.round_ends?
  end

  def end_game
    game_summary
  end

  def round
    loop do
      break unless @game.winner.nil?

      round_ends? ? end_round : send(action)
    end
    end_game
  end

  def action
    draw(true) if @game.status == :user_turn
    @game.round
  end

  def end_round
    @game.round
    round_summary(@game.status)
    view_balance
    puts "game_ends?  : #{game_ends?}"
    if game_ends?

      @game.game_winner
    else
      play_again ? @game.round_start : @game.game_winner
    end
  end

  def play_again
    puts
    puts 'New Round?'
    puts 'Yes, enter 1'
    puts 'No, enter 0'
    input = gets.chomp
    case input
    when '0'
      false
    when '1'
      true
    else
      puts 'Cannot gets you'
    end
  end

  def input_nickname
    puts 'Enter your name'
    gets.chomp
  end

  def dealer_win
    end_round
  end

  def player_win
    end_round
  end

  def tie
    end_round
  end

  def user_turn
    # draw(true)
    loop do
      puts ''
      puts 'Select action'
      puts 'Skip turn press 1'
      puts 'Add card press 2'
      puts 'Open cards 3'

      choise = gets.chomp.to_i
      case choise
      when 1
        return @game.status = :dealer_turn
      when 2
        return @game.status = :player_add_card
      when 3
        return @game.status = :open_cards
      else
        puts 'Cannot get you.'
      end
    end
  end

  def draw_it
    draw(true)
  end
end
