module Draw
  def draw
    puts
    header
    view_cards
    puts
    view_scores
    puts
  end

  def view_scores
    scores = @game.scores
    puts "Player score: #{scores[:player]}"
    puts "Dealer score: #{scores[:dealer]}"
  end

  def view_cards
    @game.cards.each do |cards|
      draw_2_cards(cards[0], cards[1])
    end
  end

  def draw_2_cards(player_card, dealer_card)
    print_card_cap(player_card, dealer_card)
    view_card_gap(player_card, dealer_card)
    view_card_suit(player_card, dealer_card)
    view_card_score(player_card, dealer_card)
    view_card_gap(player_card, dealer_card)
    print_card_cap(player_card, dealer_card)
  end

  def view_card_score(card1, card2)
    card_part(card1.nil? ? nil : card1[:view], card2.nil? ? nil : card2[:view])
  end

  def view_card_suit(card1, card2)
    card_part(card1.nil? ? nil : card1[:suit], card2.nil? ? nil : card2[:suit])
  end

  def view_card_gap(card1, card2)
    card_part(card1.nil? ? nil : ' ', card2.nil? ? nil : ' ')
  end

  def print_card_cap(no_player_card, no_dealer_card)
    gap(3)
    no_player_card.nil? ? (6.times { print ' ' }) : (6.times { print '-' })
    gap(20)
    no_dealer_card.nil? ? (6.times { print ' ' }) : 6.times { print '-' }
    puts
  end

  def card_part(card1, card2)
    gap(3)
    if card1.nil?
      gap(6)
    else
      print '| '
      view_suit(card1)
      print ' |'
    end
    gap(20)
    if card2.nil?
      gap(6)
    else
      print '| '
      view_suit(card2)
      print ' |'
    end
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
    draw
    puts
    gap(10)
    status != 'tie' ? (puts status) : (puts 'Tie Game')
    puts
  end

  def game_summary
    puts
    puts "#{@game.winner&.nickname} wins the game!"
    puts
    view_balance
  end

  def view_balance
    puts " Player balance: #{@game.player.balance} "
    puts " Dealer balance: #{@game.dealer.balance} "
  end
end
