class Players
  attr_reader :cards, :balance

  def initialize(cards)
    @cards = cards
    @balance = 100
  end

  def add_card(card)
    @cards << card
  end

  def bet
    @balance -= 10
    10
  end

  def score
    puts 'score'
  end
end
