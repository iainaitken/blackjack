class Card
  attr_reader :suit, :rank
  
  def initialize(suit:, rank:)
    @suit = suit.to_sym
    @rank = rank.to_sym
  end
end