class Card
  attr_reader :suit, :rank, :label
  
  def initialize(suit:, rank:)
    @suit = suit
    @rank = rank
    @label = create_label
  end

  private

  def create_label
    label = "#{rank_shorthand}#{suit_shorthand}"
  end
  
  def rank_shorthand
    face_card? ? @rank.chr.upcase : @rank
  end

  def suit_shorthand
    @suit.chr
  end

  def face_card?
    face_cards = ['ace', 'king', 'queen', 'jack']
    face_cards.include?(@rank)
  end
end