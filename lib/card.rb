# frozen_string_literal: true

# The Card class represents the cards with which the blackjack game will be played.
# The class knows the suit and rank of the card, and also a label for gameplay purposes.
class Card
  attr_reader :suit, :rank, :label

  def initialize(suit:, rank:)
    @suit = suit
    @rank = rank
    @label = create_label
  end

  private

  def create_label
    "#{rank_shorthand}#{suit_shorthand}"
  end

  def rank_shorthand
    face_card? ? rank.chr.upcase : rank
  end

  def suit_shorthand
    suit.chr
  end

  def face_card?
    face_cards = %w[ace king queen jack]
    face_cards.include?(rank)
  end
end
