class Round

  attr_reader :player, :dealer, :carddeck, :bank

  def initialize( nickname = 'player')
    @carddeck = CardDeck.new
    @player = Human.new( @carddeck.give_cards(2), nickname)
    @dealer = Dealer.new(@carddeck.give_cards(2))
    @bank = @player.bet + @dealer.bet
  end

  def player_turn
    puts 'player_turn'
  end
end
