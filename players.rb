class Player
  attr_reader :cards, :balance, :nickname

  def initialize(nickname)
    @cards = []
    @balance = 100
    @nickname = nickname
  end

  def self.win
    @wins ||= 0
    @wins += 1
  end

  def self.wins
    @wins ||= 0
    @wins
  end

  def add_card(card)
    @cards << card
  end

  def new_cards(cards)
    @cards = []
    cards.each do |cart|
      @cards << cart
    end
  end

  def bet
    @balance -= 10
    10
  end

  def cash_back(money)
    @balance += money
  end

  def score
    simple_score = simple_points(@cards)
    aces = @cards.select { |card| card.points.size > 1 }
    return simple_score if aces.size.zero?

    best_score(ace_points(aces), simple_score)
  end

  def win
    self.class.win
  end

  def wins
    self.class.wins
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

  def best_score(scores, simple_points)
    result = 0
    results = []
    scores.each do |ace_score|
      score = ace_score + simple_points
      results << score
      result = score if result < score && score <= 21
    end
    return result unless result.zero?

    results.min
  end

  def simple_points(cards)
    simple_score = 0
    cards.each do  |card|
      simple_score += card.points.join.to_i if card.points.size == 1
    end
    simple_score
  end
end
