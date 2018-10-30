require "test_helper"
require "poker_hands/hand"

module PokerHands
  class HandTest < Minitest::Test

    def test_hand_is_class
      assert_equal true, Hand.is_a?(Class)
    end

    def test_hand_is_5_cards
      assert_raises(IllegalHandError) do
        invalid_hand = PokerHands::Hand.new([
          ["jack", :clubs],
          ["jack", :diamonds],
          ["jack", :hearts]
        ])
      end

      valid_hand = PokerHands::Hand.new([
        ["jack", :clubs],
        ["jack", :diamonds],
        ["jack", :hearts],
        ["jack", :spades],
        [2, :hearts]
      ])
      assert true, valid_hand.is_a?(Hand)
    end

    def test_hands_get_sorted_by_rank_and_suit_on_initialize
      hand = PokerHands::Hand.new([
        [10, :hearts],
        [2, :hearts],
        [7, :hearts],
        ["queen", :hearts],
        ["ace", :hearts]
      ])

      sorted_hand = [
        ["ace", :hearts],
        ["queen", :hearts],
        [10, :hearts],
        [7, :hearts],
        [2, :hearts]
      ]
      assert_equal hand.cards, sorted_hand
    end
  end
end

