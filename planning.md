# Planning

## User Stories

### Story

> As a player
>
> So that I can play a game of BlackJack
>
> I want to be able to start a one-player game of BlackJack

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| Game | Start |

### Story

> As a player
>
> So that I can start a round of BlackJack in my game
>
> I want to have cards dealt to me and to the dealer

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| Round | Start |
| Game | Deal |
| Dealer |  |

### Story

> As a player
>
> So that my BlackJack game is more interesting
>
> I want to be able to place a bet on my hand before it has been dealt to me

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| Bet | Place |
| Hand | Deal |

### Story

> As a player
>
> So that I can know if I have won a round of BlackJack
>
> I want the cards in my hand to be scored

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| Card | Score |
|  | Win |

### Story

> As a player
>
> So that I can see if I have won
>
> I want to know if either the dealer or I have BlackJack (Ace and 10-point card)

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| BlackJack |  |

### Story

> As a player
>
> So that I have more options to win
>
> If I do not have BlackJack, I want to be able to choose whether an Ace card in my hand is worth 1 or 11 points

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| Card | Choose |
| Hand |  |

### Story

> As a player
>
> So that the round can continue if neither I nor the dealer has BlackJack
>
> I want to be able to choose to have more cards dealt, until I stop or go bust, and for the dealer to take a turn after me

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| Card | Deal |

### Story

> As a player
>
> So that my game can be more exciting
>
> My bet should pay out if I win and be lost if I lose

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
|  |  |

### Story

> As a player
>
> So that my game can be more complex and interesting
>
> I should be able to split my hand if my first two cards are of the same denomination

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| Hand | Split |

### Story

> As a player
>
> So that my game can be more complex and interesting
>
> I should be able to double down if my original cards total 9, 10, or 11

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| Hand | Double |

### Story

> As a player
>
> So that my game can be more complex and interesting
>
> I should be able to buy insurance if the dealer's face-up card is an ace

### Nouns/verbs

| Nouns | Verbs |
| ----- | ----- |
| Hand | Buy |
| Insurance |  |

## Class Diagram

| Class:  |
| ------- |
| __Attributes__ |
| |
| __Methods__ |
| |

## Sequence Diagram

[diagram.codes](https://playground.diagram.codes/d/sequence)

````ruby
alias user="Player"
alias game="Game"

alias menu="Main Menu"
alias table="Table"
alias deck="Deck"
alias card="Card"
alias hand="Hand"
alias bank="Player Bank"
alias bet="Bet"

user->game:"new game"
game->menu:"display main menu"
menu-->game:"return main menu"
user->game:"create new game"
game->table:"create new table instance"
table-->game:"return new table instance"
game->deck:"create new deck instance"
deck->card:"create new card instances"
card-->deck:"return new card instances"
deck->deck:"store cards in deck"
deck-->game:"confirm deck initiated"
```
