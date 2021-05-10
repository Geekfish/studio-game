# frozen_string_literal: true

require_relative 'lib/studio_game/game'
require_relative 'lib/studio_game/player'
require_relative 'lib/studio_game/clumsy_player'
require_relative 'lib/studio_game/berserk_player'

include StudioGame

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

PLAYER_CLASSES = {
  'regular' => Player,
  'clumsy' => ClumsyPlayer,
  'berserk' => BerserkPlayer
}.freeze

def load_players(filename)
  File.readlines(filename).map do |line|
    type, *args = line.split(',')
    PLAYER_CLASSES[type].from_csv(*args)
  end
end

def read_input # rubocop:disable Metrics/MethodLength
  puts "How many rounds? (or type 'quit' to exit)"
  input = gets.chomp.downcase
  case input
  when /^\d+$/
    input.to_i
  when 'exit', 'quit', 'q'
    :exit
  else
    puts "Please enter a number or type 'quit'"
    read_input
  end
end

def run
  loop do
    players = load_players(ARGV.shift || 'bin/default_players.csv')

    input = read_input
    break if input == :exit

    num_rounds = input
    game = Game.new('Knuckleheads', players)
    game.play(num_rounds) { game.total_points >= 10_000 }
  end
end

run if __FILE__ == $PROGRAM_NAME
