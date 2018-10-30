require "test_helper"
require "poker_hands/hand"

module PokerHands
  class SearchUtilitiesTest < Minitest::Test

    def test_search_utilities_is_a_module
      assert_equal true, SearchUtilities.is_a?(Module)
    end

    def test_royal_flush
      hand = PokerHands::Hand.new([
        ["ace", :hearts],
        ["king", :hearts],
        ["queen", :hearts],
        ["jack", :hearts],
        [10, :hearts]
      ])
      assert hand.score, ROYAL_FLUSH
    end

    def test_straight_flush
      hand = PokerHands::Hand.new([
        ["jack", :hearts],
        [10, :hearts],
        [9, :hearts],
        [8, :hearts],
        [7, :hearts]
      ])
      assert hand.score, STRAIGHT_FLUSH
    end

    def test_four_of_a_kind
      hand = PokerHands::Hand.new([
        [10, :clubs],
        [10, :diamonds],
        [10, :hearts],
        [10, :spades],
        [7, :hearts]
      ])
      assert hand.score, FOUR_OF_A_KIND
    end

    def test_full_house
      hand = PokerHands::Hand.new([
        [10, :clubs],
        [10, :diamonds],
        [10, :hearts],
        [7, :spades],
        [7, :hearts]
      ])
      assert hand.score, FULL_HOUSE
    end

    def test_flush
      hand = PokerHands::Hand.new([
        [10, :clubs],
        [2, :clubs],
        [8, :clubs],
        [4, :clubs],
        ["king", :clubs]
      ])
      assert hand.score, FLUSH
    end

    def test_straight
      hand = PokerHands::Hand.new([
        ["jack", :clubs],
        [10, :diamonds],
        [9, :hearts],
        [8, :hearts],
        [7, :spades]
      ])
      assert hand.score, STRAIGHT
    end

    def test_three_of_a_kind
      hand = PokerHands::Hand.new([
        [10, :clubs],
        [10, :diamonds],
        [10, :hearts],
        ["king", :spades],
        ["jack", :hearts]
      ])
      assert hand.score, THREE_OF_A_KIND
    end

    def test_two_pair
      hand = PokerHands::Hand.new([
        [10, :clubs],
        [10, :diamonds],
        [6, :hearts],
        [6, :spades],
        [7, :hearts]
      ])
      assert hand.score, TWO_PAIR
    end

    def test_one_pair
      hand = PokerHands::Hand.new([
        [10, :clubs],
        [10, :diamonds],
        [4, :hearts],
        [6, :spades],
        [7, :hearts]
      ])
      assert hand.score, ONE_PAIR
    end

    def test_high_card
      skip "WIP"
    end
  end
end
