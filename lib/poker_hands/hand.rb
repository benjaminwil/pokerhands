require "poker_hands/hand_types"
require "poker_hands/search_utilities"

module PokerHands

  class IllegalHandError < StandardError; end

  class Hand
    include PokerHands::HandTypes
    include PokerHands::SearchUtilities

    attr_reader :cards, :score

    def initialize(cards)
      sorted_cards = sort_hand_by_deck_order(cards)
      @cards = sorted_cards
      @score = evaluate_hand
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
