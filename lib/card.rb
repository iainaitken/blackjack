class Card
  attr_reader :suit, :rank, :label
  
  def initialize(suit:, rank:)
    @suit = suit
    @rank = rank
    @label = create_label
  end

  private

  def create_label
    rank_shorthand = shorten_rank
    suit_shorthand = shorten_suit
    label = "#{rank_shorthand}#{suit_shorthand}"
  end

  def shorten_suit
    @suit.chr
  end

  def shorten_rank
    case @rank
    when 'ace'
      'A'
    when 'king'
      'K'
    when 'queen'
      'Q'
    when 'jack'
      'J'
    else
      @rank
    end
  end
end