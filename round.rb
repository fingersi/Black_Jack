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
    add_card(@player)
    play unless check_points?
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
    if winner_player == false
      @player.cash_back(bet)
      @dealer.cash_back(bet)
    else
      winner_player.cash_back(@bank)
    end
    puts " @player.balance #{@player.balance} "
    puts " @dealer.balance #{@dealer.balance} "
    @bank = 0
  end

  def too_much
    draw(false)
    puts
    puts
    return @dealer if (@player.score) > 21

    return @player if (@dealer.score) >= 21

    false
  end

  def winner
    return too_much if too_much

    return @player if @player.score > @dealer.score

    return @dealer if @dealer.score > @player.score

    return nil if @dealer.score == @player.score
  end
end
