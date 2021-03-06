require "test_helper"
require "poker_hands/deck"

module PokerHands
  class DeckTest < Minitest::Test

    def setup
      @deck = Deck.new
      @ranks = @deck.ranks
      @suits = @deck.suits
    end

    def test_deck_is_class
      assert_equal true, Deck.is_a?(Class)
    end

    def test_new_deck_is_52_cards
      assert_equal 52, @deck.cards.count
    end

    def test_deck_has_4_cards_of_each_rank
      @ranks.each do |rank|
        assert_equal 4, @deck.find_by_suit_or_rank(rank).count
      end
    end

    def test_deck_has_13_cards_of_each_suit
      @suits.each do |suit|
        assert_equal 13, @deck.find_by_suit_or_rank(suit).count
      end
    end
  end
end
