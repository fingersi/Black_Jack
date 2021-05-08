class CardDeck
  attr_reader :cards

  def initialize
    @cards = cards_generator
    shuffle
    shuffle
  end

  def view
    @cards.each(&:view)
  end

  def shuffle
    @cards.each_with_index do |_card, index|
      @cards.insert((rand @cards.size), @cards.delete_at(index))
    end
  end

  def give_cards(number = 1)
    @cards.shift(number)
  end

  private

  def cards_generator
    # utf_suit = ['U+2665', 'U+2666', 'U+2663', 'U+2660']
    simle_suits = ['<3', '<>', '+', '^']
    all_cards = []
    cardline.each do |card|
      simle_suits.each do |suit|
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
