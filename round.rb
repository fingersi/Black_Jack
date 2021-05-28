class Round
  include Draw

  attr_reader :player, :dealer, :carddeck, :bank

  def initialize(nickname = 'player')
    @carddeck = CardDeck.new
    @player = User.new(@carddeck.give_cards(2), nickname)
    @dealer = Dealer.new(@carddeck.give_cards(2))
    @bank = @player.bet + @dealer.bet
    game
  end

  private

  def game
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
    puts 'player_add_card'
    add_card(@player)
    # game
  end

  def add_card(player)
    puts 'add_card'
    player.add_card(@carddeck.give_a_card)
    check_points?
    false
  end

  def open_cards
    game_end(winner)
  end

  def check_points?
    winner_player = too_much
    puts "check_points? winner_player:#{winner_player}"
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
    puts 'too_much'
    draw(false)
    puts
    puts
    return @dealer if (@player.score) > 21

    return @player if (@dealer.score) >= 21

    false
  end

  def winner
    return @player if @player.score > @dealer.score

    return @dealer if @dealer.score > @player.score

    return nil if @dealer.score == @player.score
  end

end
