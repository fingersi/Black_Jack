class Card
  attr_reader :suit, :type, :point

  CARDPOINTS = { 'J' => [10], 'Q' => [10], 'A' => [1, 10] }.freeze

  # { 'J' => [10], 'Q' => [10], 'A' => [1, 10] }
  # CARDPOINTS['J'] = [10]
  # CARDPOINTS['Q'] = [10]
  # CARDPOINTS['A'] = [1, 10]

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
    puts "CARDPOINTS[point].nil? #{CARDPOINTS[point].nil?}"
    return @points = [point.to_i] if CARDPOINTS[point].nil?

    @points = CARDPOINTS[point]
  end
end
