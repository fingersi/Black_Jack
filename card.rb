class Card
  attr_reader :suit, :type, :point

  CARDPOINTS = {}
  CARDPOINTS['J'] = [10]
  CARDPOINTS['Q'] = [10]
  CARDPOINTS['A'] = [1, 10]

  def initialize(point, suit)
    @suit = suit
    card_point_setter(point)
  end

  def card_point_setter(point)
    @view = point
    return @points = [point.to_i] if CARDPOINTS[point].nil?

    @points = CARDPOINTS[point]
  end
end
