# PokerHands

A simple poker hand scoring machine.

## Usage

You have multiple poker hands:

```ruby
hand1 = [[3, :hearts], [7, :diamonds], [8, :clubs], [10, :spades], [2, :hearts]]
hand2 = [["ace", :spades], [7, :spades], [2, :spades], [9, :spades], [3, :spades]]
hand3 = [[10, :clubs], ["ace", :clubs], [9, :clubs], ["queen", :diamonds], [4, :diamonds]]
```

To find out the winner, you create a new `Contest`:

```ruby
contest = PokerHands::Contest.new(hand1, hand2, hand3)
```

Before the contest is initialized:

- Each hand is validated and pushed to a new `Hand` object.
- Each `Hand` is evaluated and given a `@score` value.

Each possible poker hand has a score between `1` and `10`, which are set in the
`PokerHands` module.

The new `Contest` can now commence. The highest `Hand.score` is the winner.

If there is no clear winner, the highest card is chosen (where the highest card
is an `["ace", :clubs]`).

In this example, the winner is `hand2` with a score of `6` (`FLUSH`):

```ruby
contest.winner
#=> #<PokerHands::Hand:0x0...
#      @cards=[["ace", :spades], [7, :spades], [2, :spades], [9, :spades], [3, :spades]],
#      @score=6>
```
