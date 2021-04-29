require 'card'

RSpec.describe Card do
  subject { described_class }

  it 'has a suit and a rank' do
    card = subject.new(suit: "clubs", rank: "ace")

    expect(card.suit).to eq(:clubs)
    expect(card.rank).to eq(:ace)
  end

end