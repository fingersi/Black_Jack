class Round
  include Draw

  attr_reader :player, :dealer, :carddeck, :bank

  def initialize(nickname = 'player')
    @carddeck = CardDeck.new
    @player = User.new(@carddeck.give_cards(2), nickname)
    @dealer = Dealer.new(@carddeck.give_cards(2))
    puts "@player.score #{@player.methods}"
    @bank = @player.bet + @dealer.bet
    game
  end

  private

  def game
    loop do
      break if send(@player.turn)
    end
  end

  def dealer_turn
    loop do
      break if @dealer.turn
    end
  end

  def add_card
    @player.add_card(@carddeck.give_a_card)
    check_points?(false)
    false
  end

  def open_cards
    draw(false)
    check_points(true)
  end

  def check_points?(ends)
    summary = game_end? 
    if summary['game_ends'] || ends == true
      summary['text']
      return true
    end
    false
  end

  def game_end?
    return game_hash(true, 'Dealer wins') if @player.score > 21 && @dealer.score <= 21

    return game_hash(true, 'Player wins') if (@player.score > @dealer.score) && @player.score <= 21

    return game_hash(true, 'Player wins') if @dealer.score > 21 && @player.score <= 21

    return game_hash(true, 'Dealer wins') if (@player.score > @dealer.score) && @player.score <= 21

    game_hash(false, text => '')
  end

  def game_hash(game_ends, text)
    { 'game_ends' => game_ends, text => text }
  end
end
