require 'blackjack'

describe 'blackjack' do
  it 'contains a deck of cards' do
    # Cards are tracked using a hash, where the keys are individual cards (i.e.
    # the Ace of Spades) and the value is the number of that card remaining in
    # the deck.
    expect(DECK).to be_instance_of(Hash)
  end

  it 'deck contains cards' do
    expect(DECK["Ac"]).not_to be(nil)
  end

  it 'deck contains 312 cards' do
    # Game uses 6 decks of cards, so the sum of all of the values in the DECK hash
    # must equal 312 at the start of the game.
    test = DECK.values.inject { |sum,number| sum + number }
    expect(test).to eq(312)
  end

  # Check that the main menu exists
  specify { expect { display_main_menu }.to output(/Main Menu/).to_stdout }

  # expect game to respond to user input
  it 'responds to user input' do
    allow($stdin).to receive(:gets).and_return("1")
    expect(user_input).to eq("1")
  end

  it 'new_game sets starting bank account' do
    expect{ new_game }.to change { @bank }.to(1000)
  end

  it 'main menu process works' do
    allow($stdin).to receive(:gets).and_return("1")
    expect(process_main(user_input)).to eq("new round")
  end

  it 'player can place bet' do
    allow($stdin).to receive(:gets).and_return("10")
    expect{ new_game }.to change { @bank }.to(1000)
    expect{ place_bet }
      .to change { @bet1 }.to(10)
      .and change { @bank }.to(990)
  end

  it 'deals cards' do
    @hand1 = []
    @dealer_hand = []
    @hand1_score = 0
    @dealer_score = 0
    allow($stdin).to receive(:gets).and_return("11")
    expect{ new_deal }
      .to change { @hand1 }
      .and change { @dealer_hand }
  end

  it 'check game displays hands correctly' do
    @dealer_hand = ["Ad", "7c"]
    expect { display_hands }.to output(/Ad/).to_stdout
  end

  it 'player wins on blackjack' do
    @hand1 = ["10s", "Ah"]
    @hand1_score = 0
    @dealer_hand = ["5d", "7c"]
    @bank = 1000
    @bet1 = 10
    expect{ blackjack }.to change { @bank }.to(1025)
  end

  it 'score_card calculates value of card' do
    expect(score_player_card("10h")).to eq(10)
    expect(score_dealer_card("Kh")).to eq(10)
  end

  it 'allows player to double, split or get insurance' do
    expect {display_options_menu}.to output(/Options/).to_stdout
  end

  it 'split method splits hand in two' do
    @bank = 1000
    @bet1 = 50
    @bet2 = 0
    @hand1 = ["Ks", "Kd"]
    @hand2 = []
    allow($stdin).to receive(:gets).and_return("4")
    expect { split }
      .to change { @hand2.first }.to("Kd")
      .and change { @bet2 }.to(50)
      .and change { @bank }.to(950)
  end

  it 'split_ace method deals cards' do
    @dealer_hand = ["Qs", "5c"]
    @hand1 = ["As"]
    @hand2 = ["Ad"]
    @hand1_score = 11
    @hand2_score = 11
    allow($stdin).to receive(:gets).and_return("1")
    expect { split_ace }
      .to change { @hand1 }
      .and change { @hand2 }
  end

  it 'calculates scores on blackjack' do
    @dealer_hand = ["3d", "5h"]
    @dealer_score = 0
    @hand1 = ["10h", "Ad"]
    @hand1_score = 0
    expect {score_blackjack}
      .to change { @hand1_score }.to(21)
      .and change { @dealer_score }.to(8)
  end

  it 'calculates scores for hand1' do
    allow($stdin).to receive(:gets).and_return("11")
    @hand1 = ["As","10c"]
    expect(score_hand(@hand1)).to eq(21)
  end

  it 'calculates scores for hand2' do
    allow($stdin).to receive(:gets).and_return("11")
    @hand2 = ["7c", "6d", "7s"]
    expect(score_hand(@hand2)).to eq(20)
  end

  it 'calculates score for dealer' do
    @dealer_ace_count = 0
    @dealer_hand = ["Ad","2h","Ah","4c"]
    expect(score_hand(@dealer_hand)).to eq(18)
  end

# test taken out due to amendments to check_scores method
=begin
  it 'compares scores and determines result of round' do
    @dealer_hand = ["Qs", "5c"]
    @hand1 = ["10s", "9h"]
    @hand2 = []
    expect { check_scores }.to output(/result/).to_stdout
  end
=end

  it 'double_down method doubles bet(s)' do
    @bet1 = 50
    @bet2 = 50
    @bank = 900
    expect { double_down }
      .to change { @bet1 }.to(100)
      .and change { @bet2 }.to(100)
      .and change { @bank }.to(800)
  end

  it 'game lets player hit or stick' do
    allow($stdin).to receive(:gets).and_return("1")
    expect { hit_or_stick_loop }.to change(@hand1)
  end

  it 'compares scores' do
    expect { compare_scores }.to output(/result/).to_stdout
  end

  it 'checks if player is bust' do
    @hand1_score = 22
    expect { player_bust(@hand1_score) }.to output(/bust/).to_stdout
  end

end
