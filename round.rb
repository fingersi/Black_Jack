class Round
  attr_reader :player, :dealer, :carddeck, :bank

  def initialize(nickname = 'player')
    @carddeck = CardDeck.new
    @player = Human.new(@carddeck.give_cards(2), nickname)
    @dealer = Dealer.new(@carddeck.give_cards(2))
    @bank = @player.bet + @dealer.bet
    human_turn
  end

  private

  def human_turn
    draw
    userinput
  end

  def userinput
    loop do
      puts ''
      puts 'Select action'
      puts 'Skip turn press 1'
      puts 'Add card press 2'
      puts 'Open cards 3'
      choise = gets.chomp.to_i
      case choise
      when 1
        dealer_turn
      when 2
        @player.add_card(@carddeck.give_a_card)
        puts "player.cards #{player.cards} "
        draw
      when 3
        open_cards
      else
        break
      end
    end
  end

  def open_cards

  end

  def draw(hide = true)
    header
    view_cards(hide)
    view_score(hide)
  end

  def view_cards(hide)
    index = 0
    [@player.cards.size, @dealer.cards.size].max.times do
      @player.cards[index]&.show(false)
      gap(23)
      @dealer.cards[index]&.show(hide)
      puts ''
      index += 1
    end
  end

  def view_score(hide)
    @player.view_score(false)
    gap(20)
    @dealer.view_score(hide)
  end

  def gap(times)
    times.times { print ' '}
  end

  def header
    print 'Players cards'
    gap(15)
    puts 'Dealer cards'
  end
end
