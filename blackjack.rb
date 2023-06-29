# frozen_string_literal: true

require_relative 'players/user'
require_relative 'players/dealer'
require_relative 'deck'

class Blackjack
  attr_accessor :deck, :bank
  attr_reader :user, :dealer

  BET_AMOUNT = 10
  LIMIT = 21
  THRESHOLD = 17

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

  def first_round
    2.times { pull_card(user) }
    user.show_info

    2.times { pull_card(dealer) }
    dealer.show_placeholder
  end

  def second_round
    open = false
    case make_choice
    when 2
      pull_card user
      user.show_info
    when 3
      open = true
    end
    pull_card(dealer) if dealer.total < THRESHOLD && !open
  end

  def define_winner
    if dealer.total > user.total && dealer.total <= LIMIT
      puts 'Дилер выиграл!'
      cash_to(dealer)
    elsif user.total > dealer.total && user.total <= LIMIT
      puts 'Вы выиграли!'
      cash_to(user)
    else
      puts 'Ничья'
      cash_to(nil)
    end
  end

  def total_score
    user.show_info
    dealer.show_info
  end

  private

  def cash_to(player)
    if player
      player.bankroll += bank
    else
      split = bank / 2
      dealer.bankroll += split
      user.bankroll += split
    end
    self.bank = 0
  end

  def make_choice
    puts '1 - пропустить'
    puts '2 - взять карту'
    puts '3 - открыться'
    print 'Выбор: '
    gets.chomp.to_i
  end

  def print_bank
    puts "Банк: #{bank}"
  end

  def pull_card(player)
    player.hand.push(deck.pull_card)
  end
end
