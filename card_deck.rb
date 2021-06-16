class CardDeck
  attr_reader :cards

  def initialize
    @cards = cards_generator
    3.times { shuffle }
  end

  def view
    @cards.each(&:show)
  end

  def shuffle
    @cards.each_with_index do |_card, index|
      @cards.insert((rand @cards.size), @cards.delete_at(index))
    end
  end

  def give_cards(number = 1)
    @cards.shift(number)
  end

  def give_a_card
    @cards.shift
  end

  private

  def cards_generator
    utf_suits = ["\u2665", "\u2666", "\u2663", "\u2660"]
    # simle_suits = ['<3', '<>', '+', '^']
    all_cards = []
    cardline.each do |card|
      utf_suits.each do |suit|
        all_cards << Card.new(card, suit)
      end
    end
    all_cards
  end

  def cardline
    card_line = []
    (2..10).each do |card|
      card_line << card
    end
    %w[J Q K A].each { |card| card_line << card }
    card_line
  end
end
