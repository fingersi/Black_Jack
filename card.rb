class Card
  attr_reader :suit, :type, :points, :view

  CARDPOINTS = { 'J' => [10], 'Q' => [10], 'K' => [10], 'A' => [1, 10] }.freeze

  def initialize(point, suit)
    @suit = suit
    card_point_setter(point)
  end

  def for_view
    { suit: @suit, view: @view }
  end

  private

  def card_view_size(symbol)
    right_length = 3
    (right_length - symbol.to_s.length).times { print ' ' } if symbol.to_s.length < right_length
  end

  def card_point_setter(point)
    @view = point
    return @points = [point.to_i] if CARDPOINTS[point].nil?

    @points = CARDPOINTS[point]
  end
end
