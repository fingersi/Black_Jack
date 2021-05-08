class Human < Players

  attr_reader :nickname

  def initialize(cards, nickname)
    super(cards)
    @nickname = nickname
  end

  def turn
    'Human turn'
  end
end
