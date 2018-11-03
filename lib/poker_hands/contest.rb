module PokerHands
  class Contest

    attr_reader :competitors, :winner

    def initialize(*hands)
      @competitors = hands.map { |hand| PokerHands::Hand.new(hand) }
      find_winner
    end

    private

    def find_winner
      if tiebreaker_required?
        find_high_card
      else
        @winner = @competitors.max_by { |competitor| competitor.score }
      end
    end

    def find_high_card
      deck = PokerHands::Deck.new
      cards = @competitors.map do |competitor|
        high_card = competitor.cards.first
        rank, suit = deck.ranks.find_index(high_card.first),
          deck.suits.find_index(high_card.last)
      end
      finalist = cards.find_index(cards.min)
      @winner = @competitors[finalist]
    end

    def tiebreaker_required?
      scores = @competitors.map { |competitor| competitor.score }
      scores.count(scores.uniq.max) != 1
    end
  end
end
