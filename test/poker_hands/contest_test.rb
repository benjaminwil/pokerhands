require "test_helper"
require "poker_hands/contest"

module PokerHands
  class ContestTest < Minitest::Test

    def setup
      @straight_flush = [
        [6, :hearts],
        [5, :hearts],
        [4, :hearts],
        [3, :hearts],
        [2, :hearts]
      ]
      @straight = [
        ["jack", :diamonds],
        [10, :hearts],
        [9, :clubs],
        [8, :clubs],
        [7, :spades]
      ]
      @high_card = [
        ["jack", :diamonds],
        [9, :clubs],
        [8, :clubs],
        [7, :spades],
        [2, :clubs]
      ]
      @low_card = [
        [7, :hearts],
        [5, :clubs],
        [4, :hearts],
        [3, :hearts],
        [2, :hearts]
      ]
    end

    def test_straight_flush_wins
      contest = PokerHands::Contest.new(@straight_flush, @straight, @high_card, @low_card)
      assert contest.winner, @straight_flush
    end

    def test_high_card_wins_against_low_card
      contest = PokerHands::Contest.new(@high_card, @low_card)
      assert contest.winner, @high_card
    end
  end
end
