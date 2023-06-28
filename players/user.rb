# frozen_string_literal: true

class User < Player

  def initialize(bankroll)
    name = username_input
    super(name, bankroll)
  end

  private

  def username_input
    print 'Имя: '
    gets.chomp
  end
end
