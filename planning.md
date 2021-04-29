# Planning

## User Stories

### Story

### Nouns/verbs



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
