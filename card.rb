# frozen_string_literal: true

class Card
  attr_reader :suit, :value, :points

  def initialize(suit:, value:, points:)
    @suit = suit
    @value = value
    @points = points
  end
end
