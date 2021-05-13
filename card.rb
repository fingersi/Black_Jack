class Card
  attr_reader :suit, :type, :points

  CARDPOINTS = { 'J' => [10], 'Q' => [10], 'K' => [10], 'A' => [1, 10] }.freeze

  def initialize(point, suit)
    @suit = suit
    card_point_setter(point)
    # puts "card #{self.methods}"
  end

  def show(hide)
    print 'card ' 
    hide ? (print 'XX') : (print "#{@view}")
    hide ? (print 'XX') : (print "#{@suit}")
  end

  private

  def card_point_setter(point)
    @view = point
    return @points = [point.to_i] if CARDPOINTS[point].nil?

    @points = CARDPOINTS[point]
  end
end
