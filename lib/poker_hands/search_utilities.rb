module PokerHands
  module SearchUtilities

    def find_by_suit_or_rank(suit_or_rank)
      @cards.select { |card| card.include?(suit_or_rank) }
    end

    def royal?
      hand = filter_hand_to_ranks
      ranks = PokerHands::Deck.new.ranks
      hand.first == ranks.first
    end

    def flush?
      suits = filter_hand_to_suits
      suits.uniq.count == 1
    end

    def straight?
      hand = filter_hand_to_ranks
      ranks = PokerHands::Deck.new.ranks
      high_card = ranks.find_index(hand.first)
      sequence = (high_card)...(high_card + 5)
      hand == ranks[sequence]
    end

    def four_of_a_kind?
      hand = filter_hand_to_ranks
      !!hand.detect do |card|
        hand.count(card) == 4
      end
    end

    def three_of_a_kind?
      hand = filter_hand_to_ranks
      !!hand.detect do |card|
        hand.count(card) == 3
      end
    end

    def two_pair?
      number_of_pairs == 2
    end

    def one_pair?
      number_of_pairs == 1
    end

    private

    def filter_hand_to_ranks
      @cards.map { |card| card.first }
    end

    def filter_hand_to_suits
      @cards.map { |card| card.last }
    end

    def number_of_pairs
      hand = filter_hand_to_ranks
      @cards.map do |card|
        next if hand.count(card) == 2
      end.compact.uniq.count
    end

  end
end
