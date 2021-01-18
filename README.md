# blackjack
I started this project so that I could practice using git, and also to practice test-driven development using rspec.

The high-level specification for the project is to create a command-line game of blackjack, similar to what you would find in a casino, including the ability to place bets and win (or lose!) money.

Detailed specifications are as follows:

Single player game - the player aims to beat the dealer by getting as close to 21 as possible, without going over 21.

Scoring:
Ace cards are either 1 or 11, based on the player's choice.
Numeric cards have their pip value.
Face cards are worth 10.

Betting:
Player chooses the value of their pot at the start of the game and chooses how much to bet for each hand, between £2 and £500.

Cards:
The game must make use of 6 decks of cards, which need to be tracked.  The deck must be reshuffled/restacked when there are fewer than 75 cards remaining in the deck.

Gameplay:
Player must place a bet.
The player is dealt two cards. The house is dealt two cards, but only one is visible to the player.
If the player has a blackjack (ace and a ten-card) then the dealer immediately pays out 1.5 times the value of the player's bet (with the stake being returned).
If the dealer has a blackjack and the player does not, the player loses their bet.
If both player and dealer have a blackjack, the player's bet is returned.
If the round has not ended yet then the player chooses to stick or hit. If the player chooses hit, another card is dealt; if the total exceeds 21, the player is bust and loses their bet. If the player sticks, their turn is over. This repeats until the player is bust or has decided to stick.
If an ace is dealt to the player, they must choose whether that card is worth 1 or 11 points. This choice can be changed at any point in the hand.
The dealer then takes it's turn. The dealer must draw on 16 or under, and stick on 17 or over. The dealer's first ace counts as 11 unless it busts the hand; subsequent aces count as 1. 
If the dealer goes bust (and the player has not) then the player wins an amount equal to their stake (with the stake also being returned).

There are three further options:
1. Splitting pairs
If the player's first two cards are of the same denomination, they may split their hand into two separate hands. The amount of the original bet goes on one of the cards, and an equal amount must be placed as a bet on the other card.  The player plays each hand in turn, as per the rules above. If the player's original cards were a pair of aces, then then the player is dealt only one additional card per ace and may not draw any more. If a ten-card is dealt to either of those aces then the payout is equal to the bet.
2. Doubling down
If the player's original two cards total 9, 10, or 11, then the player may choose to double down by placing a further bet equal to the original bet. The dealer then deals a single card to the player, whose turn is then over. The player may decide to double down after splitting.
3. Insurance
If the dealer's face-up card is an ace, the player may opt to take insurance by placing a side-bet of half of the value of their original bet. If the dealer's second card is a ten-card, then the player is paid double the amount of their side-bet but loses their main bet (unless the player also has a blackjack, in which case refer tot he rules above).

The game continues until the player has lost all of their money or until they choose to end the game.
