class Card
  attr_reader :suit, :type, :point

  CARDPOINTS = { 'J' => [10], 'Q' => [10], 'A' => [1, 10] }.freeze

  def initialize(point, suit)
    @suit = suit
    card_point_setter(point)
  end

  def view
    puts "card #{@view}  #{@suit}"
  end

  private

  def card_point_setter(point)
    @view = point
    return @points = [point.to_i] if CARDPOINTS[point].nil?

    @points = CARDPOINTS[point]
  end
end
