require "test_helper"
require "poker_hands/hand"

module PokerHands
  class HandTest < Minitest::Test
    def test_hand_is_class
      assert_equal true, Hand.is_a?(Class)
    end
    
    def test_hand_is_5_cards
      skip "WIP"
    end
    
    def test_royal_flush
      skip "WIP"
    end
    
    def test_straight_flush
      skip "WIP"
    end

    def test_four_of_a_kind
      skip "WIP"
    end
    
    def test_full_house
      skip "WIP"
    end
    
    def test_flush
      skip "WIP"
    end

    def test_straight
      skip "WIP"
    end

    def test_three_of_a_kind
      skip "WIP"
    end

    def test_two_pair
      skip "WIP"
    end

    def test_one_pair
      skip "WIP"
    end

    def test_high_card
      skip "WIP"
    end
  end
end
