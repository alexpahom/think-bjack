# frozen_string_literal: true

class Card
  attr_reader :name, :points

  def initialize(suit:, face:, points:)
    @name = "#{face}#{suit}"
    @points = points
  end
end
