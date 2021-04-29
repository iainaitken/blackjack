require 'card'

RSpec.describe Card do
  subject { described_class }

  it 'has a suit and a rank' do
    card = subject.new(suit: "clubs", rank: "ace")

    expect(card.suit).to eq("clubs")
    expect(card.rank).to eq("ace")
  end

  it 'works with number cards' do
    card = subject.new(suit: "spades", rank: "7")

    expect(card.suit).to eq("spades")
    expect(card.rank).to eq("7")
  end

  # describe '#display' do
  #   it 'displays the suit and rank in shorthand' do
      
  #   end
  # end
end