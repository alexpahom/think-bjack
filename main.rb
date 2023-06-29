require_relative 'blackjack'

Blackjack.new.tap do |game|
  game.make_bets
  game.first_round
  game.second_round
  game.total_score
  game.define_winner
end
