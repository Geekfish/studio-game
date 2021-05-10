# frozen_string_literal: true

require_relative 'game'
require_relative 'player'
require_relative 'clumsy_player'
require_relative 'berserk_player'

module StudioGame
  module Runner
    PLAYER_CLASSES = {
      'regular' => Player,
      'clumsy' => ClumsyPlayer,
      'berserk' => BerserkPlayer
    }.freeze

    def self.load_players(filename)
      File.readlines(filename).map do |line|
        type, *args = line.split(',')
        PLAYER_CLASSES[type].from_csv(*args)
      end
    end

    def self.read_input # rubocop:disable Metrics/MethodLength
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

    def self.run
      loop do
        players = load_players(ARGV.shift || 'bin/default_players.csv')

        input = read_input
        break if input == :exit

        num_rounds = input
        game = Game.new('Knuckleheads', players)
        game.play(num_rounds) { game.total_points >= 10_000 }
      end
    end
  end
end
