class Player

  attr_reader :nickname, :cards, :balance

  def initialize(nickname, cards)
    @nickname = nickname
    @cards = cards
    @balance = 100
  end

  def add_card(card)
    @cards << card
  end

  def bet
    @balance -= 10
  end


end