module Pokerhander
  class Deck
    attr_reader :cards

    def initialize
      create_new_deck
    end

    def find_by_suit_or_rank(suit_or_rank)
      @cards.select { |item| item.include?(suit_or_rank) }
    end

    private

    def create_new_deck
      @cards = ranks.product(suits)
    end

    def suits
      [:clubs, :diamonds, :hearts, :spades]
    end

    def ranks
      ["ace", "king", "queen", "jack", 10, 9, 8, 7, 6, 5, 4, 3, 2]
    end
  end
end
