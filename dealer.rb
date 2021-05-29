class Dealer < Players
  def initialize
    super('dealer')
  end

  def turn
    return true if score <= 17

    false
  end
end
