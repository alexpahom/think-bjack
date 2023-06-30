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
    self.bankroll -= amount
    raise ArgumentError.new(self.name.to_s) if bankroll.negative?
  end

  def show_cards
    hand.each do |card|
      puts "#{card.name} - #{card.points}"
    end
  end

  def show_total
    puts "Очки: #{total}"
  end

  def show_balance
    puts "Баланс: #{bankroll}"
  end

  def total
    hand.map(&:points).sum
  end

  def show_info
    puts name
    show_cards
    show_total
    show_balance
    puts '-' * 15
    puts
  end
end
