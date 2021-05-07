# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/game/player'

if __FILE__ == $PROGRAM_NAME
  players = [
    Player.new('larry', 60),
    Player.new('curly', 125),
    Player.new('moe'),
    Player.new('shemp', 90)
  ]

  game = Game.new('Knuckleheads', players)
  game.add_player(Player.new('simba', 82))
  game.play
end
