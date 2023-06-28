# frozen_string_literal: true

class Dealer < Player

  DEALER = 'Дилер'
  def initialize(bankroll)
    super(DEALER, bankroll)
  end
end
