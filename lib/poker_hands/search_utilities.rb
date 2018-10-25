module PokerHands
  module SearchUtilities
    
    def find_by_suit_or_rank(suit_or_rank)
      @cards.select { |item| item.include?(suit_or_rank) }
    end

  end
end
