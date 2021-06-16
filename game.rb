class Game
  attr_accessor :status
  attr_reader :player, :dealer, :winner

  GAME_END_STATUS = %i[player_wins_game dealer_wins_game].freeze

  ROUND_END_STATUS = %i[player_win dealer_win tie].freeze

  def initialize(nickname)
    @winner = nil
    @player = Player.new(nickname)
    @dealer = Player.new('Dealer')
    round_start
  end

  def round_start
    @bank = 0
    @carddeck = CardDeck.new
    @bank = @player.bet + @dealer.bet
    @player.new_cards(@carddeck.give_cards(2))
    @dealer.new_cards(@carddeck.give_cards(2))
    @status = :user_turn
  end

  def round
    send(@status)
    @status
  end

  def user_turn
    @status = :draw_it
  end

  def draw_it
    @status = :user_turn
  end

  def round_ends?
    case @status
    when *ROUND_END_STATUS
      true
    else
      false
    end
  end

  def player_add_card
    add_card(@player)
    too_much ? (@status = too_much) : (@status = 'draw_it')
  end

  def game_ends?
    @status = check_balance if check_balance

    case @status
    when *GAME_END_STATUS
      HiScore.add_score({ nickname: @player.nickname, wins: @player.wins })
      true
    else
      false
    end
  end

  def open_cards
    @status = round_winner
  end

  def dealer_turn
    loop do
      dealer_logic ? add_card(@dealer) : break
    end
    @status = user_turn unless too_much
  end

  def clear_game
    round_start
    @status
  end

  def game_winner
    @winner = @player if @player.balance > @dealer.balance
    @winner = @dealer if @player.balance < @dealer.balance
    @winner = 'tie' if @player.balance == @dealer.balance
  end

  private

  def check_balance
    if @player.balance <= 0
      @winner = @dealer
      return :dealer_wins_game
    end
    if @dealer.balance <= 0
      @winner = @player
      return :player_wins_game
    end

    false
  end

  def add_card(player)
    player.add_card(@carddeck.give_a_card)
    check_points?
  end

  def check_points?
    winner_player = too_much
    if winner_player != false
      @status = winner_player
      return true
    end
    false
  end

  def dealer_win
    @dealer.cash_back(@bank)
  end

  def player_win
    @player.cash_back(@bank)
  end

  def tie
    bet = @bank / 2
    @player.cash_back(bet)
    @dealer.cash_back(bet)
  end

  def too_much
    return 'dealer_win' if (@player.score) > 21

    return 'player_win' if (@dealer.score) > 21

    false
  end

  def round_winner
    return too_much if too_much

    if @player.score > @dealer.score
      @player.win
      return :player_win
    end

    return :dealer_win if @dealer.score > @player.score

    return :tie if @dealer.score == @player.score
  end

  def dealer_logic
    return true if @dealer.score <= 17

    false
  end
end
