require_relative "deck"
require_relative "menus"

@bank = 0.0
@bet1 = 0.0
@bet2 = 0.0
@current_hand = 1
@dealer_ace_count = 0
@dealer_card = "hidden"
@dealer_hand = []
@dealer_score = 0
@hand1 = []
@hand1_score = 0
@hand2 = []
@hand2_score = 0
@number_of_hands = 1

def round_loop
  print_new_round
  place_bet
  new_deal
  display_hands
  blackjack
  options_menu
  # double, split or insurance


    # check win lose draw etc
  hit_or_stick_menu
  reveal_dealer_card
  # dealer turn
  # win/lose/payout - check scores leads to result method which will calculate
    #payout and reset game
  # puts bank amount
  # reset hands
  # reshuffle if deck < 75
  end_menu
end

def blackjack
  score_blackjack
  if @hand1_score == 21
    if @dealer_score < 21
      @bank = @bank + (@bet1 + (@bet1 * 1.5))
      reveal_dealer_card
      win_round
    elsif @dealer_score == 21
      reveal_dealer_card
      stalemate
    end
  end
end

=begin
def check_scores
  @dealer_score = score_hand(@dealer_hand)
  @hand1_score = score_hand(@hand1)
  if @number_of_hands == 2
    @hand2_score = score_hand(@hand2)
  end
end
=end

def choose_value_of_ace
  loop do
    puts "Please choose a value for your ace: 1 or 11"
    selection = user_input.to_i
    if selection == 1 or selection == 11
      return selection
    end
  end
end

def compare_scores

end

def deal_card
  loop do
    card = DECK.keys.sample
    if DECK[card] > 0
      DECK[card] -= 1
      return card
    end
  end
end

def deal_to_player(hand)
  card = deal_card
  if hand == @hand1
    @hand1.push(card)
  elsif hand == @hand2
    @hand2.push(card)
  end
end

def deal_to_dealer
  card = deal_card
  @dealer_hand.push(card)
end

def display_hands
  puts "-----Dealer------"
  if @dealer_card == "hidden"
    puts @dealer_hand.first
  else
    print "#{@dealer_hand}\n"
  end
  puts "-----Player------"
  print "#{@hand1}\n"
  print "#{@hand2}" if @number_of_hands == 2
  puts "-----------------"
end

def double_down
  @bank -= @bet1
  @bank -= @bet2
  @bet1 *= 2
  @bet2 *= 2
  # need to expand to cover entire game loop if player selects double
end

def end_game
  puts "Goodbye!"
  exit
end

def hit
  if @number_of_hands == 2 and @current_hand == 2
    deal_to_player(@hand2)
  else
    deal_to_player(@hand1)
  end
  display_hands
  if @current_hand == 1
    score_hand(@hand1)
    player_bust(@hand1_score)
  elsif @current_hand == 2
    score_hand(@hand2)
    player_bust(@hand2_score)
  end
  # player_bust() - lose
  # player not bust - continue loop
end

def load_game
  puts "todo"
end

def new_deal
  print_deal
  2.times do
    deal_to_player(@hand1)
    deal_to_dealer
  end
end

def new_game
  @bank = 1000.0
  puts "-----------------"
  puts "Start new game"
  puts "Your bank account is #{@bank}"
  puts "-----------------"
  "new round"
end

def place_bet
  puts "Please enter an amount to bet"
  loop do
    bet = user_input.to_f
    if bet <= @bank
      @bet1 = bet
      @bank = @bank - bet
      print_bank_account
      break
    elsif bet > @bank
      puts "You do not have that much money! Please try again!"
    else
      puts "Please try again"
    end
  end
end

def player_bust(hand)
  puts "bust" if hand > 21
  # if current hand == 1 and no of hands == 2
  # go to hand 2
  # else dealer turn
  # if not bust, return

end

def print_bank_account
  puts "Your bank account is now #{@bank}"
end

def print_new_round
  puts "New round"
  puts "-----------------"
end

def print_deal
  puts "-----------------"
  puts "Dealing cards"
  puts "-----------------"
end

def reveal_dealer_card
  @dealer_card = "not hidden"
  display_hands
end

def score_blackjack
  score_hand(@dealer_hand)
  @hand1.each do |card|
    face_value = card.chop
    score = SCORES[face_value]
    @hand1_score += score
  end
end

def score_dealer_card(card)
  face_value = card.chop
  if face_value == "A"
    @dealer_ace_count += 1
    @dealer_ace_count == 1 ? score = 11 : score = 1
  else
    score = SCORES[face_value]
  end
  return score
end

def score_hand(hand)
  if hand == @hand1
    @hand1_score = @hand1.collect { |card| score_player_card(card) }.inject(:+)
  elsif hand == @hand2
    @hand2_score = @hand2.collect { |card| score_player_card(card) }.inject(:+)
  elsif hand == @dealer_hand
    @dealer_score = @dealer_hand.collect { |card| score_dealer_card(card) }.inject(:+)
  end
end

def score_player_card(card)
  face_value = card.chop
  if face_value == "A"
    score = choose_value_of_ace
  else
    score = SCORES[face_value]
  end
  return score
end

def split
  if @hand1.first.chop != @hand1.last.chop
    puts "You can only split if your hand contains two cards of the same value"
    options_menu
  elsif @bet1 > @bank
    puts "You do not have enough money in your bank account to split"
    options_menu
  else
    @number_of_hands = 2
    @hand2.push(@hand1.pop)
    @bet2 = @bet1
    @bank -= @bet2
    puts "#{@bet2} has been bet on your second hand"
    print_bank_account
    if @hand1.first.chop == "A"
      split_ace
    end
    display_hands
    options_menu
  end
end

def split_ace
  deal_to_player(@hand1)
  deal_to_player(@hand2)
end

def stalemate
  puts "todo stalemate"
end

def user_input
  $stdin.gets.chomp
end

def win_round
  puts "todo win"
end
