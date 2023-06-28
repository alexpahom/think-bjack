# frozen_string_literal: true

class Blackjack
  attr_accessor :deck, :bank
  attr_reader :user, :dealer

  BET_AMOUNT = 10

  def initialize
    @user = User.new 100
    @dealer = Dealer.new 100
    @deck = Deck.new
    @bank = 0
  end

  def make_bets
    user.make_bet BET_AMOUNT
    dealer.make_bet BET_AMOUNT
    self.bank += BET_AMOUNT * 2
  end

  def pull_card(player)
    player.hand.push(deck.pull_card)
  end
end
