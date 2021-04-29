require 'card'

RSpec.describe Card do
  subject { described_class.new }

  it 'has a suit' do
    expect(subject.suit).to eq(:clubs)
  end

  it 'has a rank' do
    expect(subject.rank).to eq(:ace)
  end
end