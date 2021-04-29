class Card
  attr_reader :suit, :rank
  
  def initialize
    @suit = :clubs
    @rank = :ace
  end
end