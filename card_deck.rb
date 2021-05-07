class CardDeck
  attr_reader :cards

  def initialize
    @cards = cards_generator
  end

  private

  def cards_generator
    utf_suit = ['U+2665', 'U+2666', 'U+2663', 'U+2660']
    simle_suits = ['<3', '<>', '+', '^']
    all_cards = []
    cardline.each do |card|
      simle_suits.each do |suit|
        all_cards << Card.new(card, suit)
      end
    end
    puts "allcards: #{all_cards}"
    all_cards
  end

  def cardline
    card_line = []
    (2..10).each do |card|
      card_line << card
    end
    %w[J Q K A].each { |card| card_line << card }
  end
end
