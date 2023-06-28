# frozen_string_literal: true

class Deck
  VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  POINTS = { 'J': [10], 'Q': [10], 'K': [10], 'A': [1, 11] }
  SUITS = %w[+ <> <3 ^]

  def initialize
    @cards = []
    create_deck
    shuffle!
  end

  def pull_card
    @cards.pop
  end

  private

  def create_deck
    VALUES.each do |value|
      SUITS.each do |suit|
        points = POINTS.has_key?(value) ? POINTS[value] : value.to_i
        @cards << Card.new(suit: suit, points: points, value: value)
      end
    end
  end

  def shuffle!
    @cards.shuffle!
  end
end
