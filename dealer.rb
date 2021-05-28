class Dealer < Players
  def initialize(cards)
    super(cards, 'Dealer')
  end

  def turn
    puts "dealer turn score: #{score}"
    return true if score <= 17

    false
  end
end
