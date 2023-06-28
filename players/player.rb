# frozen_string_literal: true

class Player
  attr_reader :name
  attr_accessor :bankroll, :hand

  def initialize(name, bankroll)
    @name = name
    @bankroll = bankroll
    @hand = []
  end

  def make_bet(amount)
    bankroll -= amount
    raise "#{name} не может сделать ставку" if bankroll.negative?
  end

  def show_cards
    hand.each do |card|
      puts "#{card.suit}#{card.face} - #{card.points}"
    end
  end
end
