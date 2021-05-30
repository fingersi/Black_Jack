module Draw
  def draw(hide)
    puts
    header
    view_cards(hide)
    puts
    view_score(hide)
    puts
  end

  def view_cards(hide)
    index = 0
    [@player.cards.size, @dealer.cards.size].max.times do
      @player.cards[index]&.show(false)
      gap(20)
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

  def game_summary(player)
    puts 'game summary'
    draw(false)
    gap(10)
    player.is_a?(Players) ? (puts "#{player.nickname} wins") : (puts 'Tie Game')
  end
end
