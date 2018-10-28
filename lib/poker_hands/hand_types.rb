module PokerHands
  module HandTypes
    def evaluate_hand
      case
      when flush? && straight? && royal?
        ROYAL_FLUSH
      when flush? && straight?
        STRAIGHT_FLUSH
      when four_of_a_kind?
        FOUR_OF_A_KIND
      when three_of_a_kind? && one_pair?
        FULL_HOUSE
      when flush?
        FLUSH
      when straight?
        STRAIGHT
      when three_of_a_kind?
        THREE_OF_A_KIND
      when two_pair?
        TWO_PAIR
      when one_pair?
        ONE_PAIR
      else
        HIGH_CARD
      end
    end
  end
end
