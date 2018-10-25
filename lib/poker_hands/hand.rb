module PokerHands

  class IllegalHandError < StandardError; end

  class Hand
    attr_reader :cards

    def initialize(cards)
      sorted_cards = sort_hand_by_deck_order(cards)
      @cards = sorted_cards
      raise IllegalHandError unless valid_hand?
      # WIP: `@cards` needs to be user input.
    end

    private

    def valid_hand?
      deck = PokerHands::Deck.new

      @cards.count == @cards.uniq.count &&
        @cards.count == 5 &&
        @cards - deck.cards == []
    end

    def sort_hand_by_deck_order(cards)
      deck = PokerHands::Deck.new
      cards.sort_by do |card|
        [deck.cards.index(card) || deck.cards.size, card]
      end
    end
  end
end

module PokerHands
  module Categories

    def evaluate(hand)

    end

  end
end
