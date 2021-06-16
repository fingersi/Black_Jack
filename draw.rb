module Draw
  def draw(hide)
    puts
    header
    view_cards(hide)
    puts
    view_scores(hide)
    puts
  end
=begin
  def view_cards(hide)
    index = 0
    [@player.cards.size, @dealer.cards.size].max.times do
      @player.cards[index].nil? ? 11.times { print ' ' } : @player.cards[index]&.show(false)
      gap(18)
      @dealer.cards[index].nil? ? 11.times { print ' ' } : @dealer.cards[index]&.show(hide)
      index += 1
    end
  end
=end

  def view_scores(hide)
    puts "score: #{@game.player.score}"
    hide ? (print 'score: XX') : (print "score: #{@game.dealer.score}")
  end

  def view_cards(hide)
    index = 0
    [@game.player.cards.size, @game.dealer.cards.size].max.times do
      draw_2_cards(@game.player.cards[index], @game.dealer.cards[index], hide)
      index += 1
    end
  end

  def draw_2_cards(player_card, dealer_card, hide)
    print_card_cap(player_card.nil?, dealer_card.nil?)
    # puts " player_card&.suit || dealer_card&.suit : #{player_card&.suit.nil? || dealer_card&.suit.nil?}"
    card_part((player_card&.suit.nil? ? nil : '  '), (dealer_card&.suit.nil? ? nil : '  '))
    card_part(player_card&.suit, hide_or_skip(hide, dealer_card&.suit))
    card_part(player_card&.view, hide_or_skip(hide, dealer_card&.view))
    card_part((player_card&.suit.nil? ? nil : '  '), (dealer_card&.suit.nil? ? nil : '  '))
    print_card_cap(player_card.nil?, dealer_card.nil?)
  end

  def hide_or_skip(hide, info)
    return nil if info.nil?

    hide ? 'XX' : info
  end

  def print_card_cap(no_player_card, no_dealer_card)
    gap(3)
    no_player_card ? (6.times { print ' ' }) : (6.times { print '-' })
    gap(20)
    no_dealer_card ? (6.times { print ' ' }) : 6.times { print '-' }
    puts
  end

  def card_part(card1, card2)
    gap(3)
    print '| ' unless card1.nil?
    view_suit(card1) unless card1.nil?
    print ' |' unless card1.nil?
    gap(20)
    print '| ' unless card2.nil?
    view_suit(card2) unless card2.nil?
    print ' |' unless card2.nil?
    puts
  end

  def view_suit(symbol)
    print symbol
    right_length = 2
    (right_length - symbol.to_s.length).times { print ' ' } if symbol.to_s.length < right_length
  end

  def gap(times)
    times.times { print ' '}
  end

  def header
    print 'Players cards'
    gap(15)
    puts 'Dealer cards'
  end

  def round_summary(status)
    puts
    draw(false)
    puts
    gap(10)
    status != 'tie' ? (puts status) : (puts 'Tie Game')
    puts
  end

  def game_summary
    puts
    puts "#{@winner&.nickname} wins the game!"
    puts
    view_balance
  end

  def view_balance
    puts " Player balance: #{@game.player.balance} "
    puts " Dealer balance: #{@game.dealer.balance} "
  end
end
