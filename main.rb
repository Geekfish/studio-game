# frozen_string_literal: true

require_relative 'lib/game'
require_relative 'lib/game/player'

def yield_block_or_function(proc_or_lambda = nil, &block)
  # Experiment
  proc_or_lambda = block || proc_or_lambda
  proc_or_lambda.call
end

def play_with_blocks
  yield_block_or_function { puts 'block' }

  my_lambda = -> { puts 'lambda' }
  yield_block_or_function(my_lambda)

  my_proc = proc { puts 'proc' }
  yield_block_or_function(my_proc)
end

if __FILE__ == $PROGRAM_NAME
  players = [
    Player.new('larry', 60),
    Player.new('curly', 125),
    Player.new('moe'),
    Player.new('shemp', 90)
  ]

  game = Game.new('Knuckleheads', players)
  game.add_player(Player.new('simba', 82))
  game.play(10) { game.total_points >= 2000 }
end
