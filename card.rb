class Card
  attr_reader :suit, :type, :points

  CARDPOINTS = { 'J' => [10], 'Q' => [10], 'K' => [10], 'A' => [1, 10] }.freeze

  def initialize(point, suit)
    @suit = suit
    card_point_setter(point)
  end

  def show(hide)
    print 'card '
    hide ? (view = 'XX') : (view = @view)
    print view
    card_view_size(view)
    hide ? (suit = 'XX') : (suit = @suit)
    print suit
    card_view_size(suit)
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
