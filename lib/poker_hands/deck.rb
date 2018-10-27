require "poker_hands/search_utilities"

module PokerHands
  class Deck
    include PokerHands::SearchUtilities

    attr_reader :cards

    def initialize
      create_new_deck
    end

    def suits
      [:clubs, :diamonds, :hearts, :spades]
    end

    def ranks
      ["ace", "king", "queen", "jack", 10, 9, 8, 7, 6, 5, 4, 3, 2]
    end

    private

    def create_new_deck
      @cards = ranks.product(suits)
    end

  end
end
