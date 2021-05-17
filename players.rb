class Players
  attr_reader :cards, :balance

  def initialize(cards)
    @cards = cards
    @balance = 100
  end

  def add_card(card)
    @cards << card
  end

  def bet
    @balance -= 10
    10
  end

  def view_score(hide)
    hide ? (print 'score: XX') : (print "score:#{score}")
  end

  def score
    simple_score = simple_points(@cards)
    aces = @cards.select { |card| card.points.size > 1 }
    return simple_score if aces.size.zero?

    best_score(ace_points(aces), simple_score)
  end

  private

  def ace_points(aces)
    ace_scores = []
    for i in 0..(aces.size) 
      ace_score = 0
      aces.each_with_index do |card, index|
        index >= i ? (ace_score += card.points.min) : (ace_score += card.points.max)
      end
      ace_scores << ace_score
    end
    ace_scores
  end

  def best_score(scores, simple_points)t = 
    result = 0
    results = scores.map do |ace_score|
                score = ace_score + simple_points
                result = score if result < score && score <= 21
              end
    return result unless result.zero?

    return results.min 
  end

  def simple_points(cards)
    simple_score = 0
    cards.each do  |card|
      simple_score += card.points.join.to_i if card.points.size == 1
    end
    simple_score
  end
end
