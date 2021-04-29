require 'card'

RSpec.describe Card do
  subject { described_class }
  let(:card1) { subject.new(suit: "clubs", rank: "ace") }
  let(:card2) { subject.new(suit: "spades", rank: "7") }

  it 'has a suit and a rank' do
    expect(card1.suit).to eq("clubs")
    expect(card1.rank).to eq("ace")
  end

  it 'works with number cards' do
    expect(card2.suit).to eq("spades")
    expect(card2.rank).to eq("7")
  end

  describe '#label' do
    it 'displays the suit and rank as a label' do
      expect(card1.label).to eq("Ac")
    end
  end
end