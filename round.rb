class Round
  include Draw

  attr_reader :player, :dealer, :carddeck, :bank

  def initialize(player, dealer)
    @carddeck = CardDeck.new
    @player = player
    @dealer = dealer
    @bank = @player.bet + @dealer.bet
    @player.new_cards(@carddeck.give_cards(2))
    @dealer.new_cards(@carddeck.give_cards(2))
    play
  end

  private

  def play
    draw(true)
    send(@player.turn)
  end

  def dealer_turn
    loop do
      @dealer.turn ? add_card(@dealer) : break
    end
    open_cards
  end

  def player_add_card
    play unless add_card(@player)
  end

  def add_card(player)
    player.add_card(@carddeck.give_a_card)
    check_points?
  end

  def open_cards
    game_end(winner)
  end

  def check_points?
    winner_player = too_much
    if winner_player != false
      game_end(winner_player)
      return true
    end
    false
  end

  def game_end(winner_player)
    game_summary(winner_player)
    bet = @bank / 2
    puts "winner_player #{winner_player}"
    if winner_player == false
      @player.cash_back(bet)
      @dealer.cash_back(bet)
    else
      winner_player&.win
      winner_player.cash_back(@bank)
    end
    puts " @player.balance #{@player.balance} "
    puts " @dealer.balance #{@dealer.balance} "
    @bank = 0
  end

  def tie_game
    true if @dealer.score == @player.score
  end

  def too_much
    return @dealer if (@player.score) > 21

    return @player if (@dealer.score) > 21

    false
  end

  def winner
    draw(false)
    return too_much if too_much

    return @player if @player.score > @dealer.score

    return @dealer if @dealer.score > @player.score

    return false if @dealer.score == @player.score
  end
end
