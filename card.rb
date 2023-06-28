# frozen_string_literal: true

class Card
  attr_reader :suit, :face, :points

  def initialize(suit:, face:, points:)
    @suit = suit
    @face = face
    @points = points
  end
end
