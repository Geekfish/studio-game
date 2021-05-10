# frozen_string_literal: true

require_relative 'die'
require_relative 'loaded_die'

module StudioGame
  module Turn
    def self.random_die
      if rand * 100 <= 15
        LoadedDie
      else
        Die
      end
    end

    def self.take(player, die_cls = Die)
      case die_cls.new.roll
      when 1..2
        player.blam
      when 5..6
        player.w00t
      else
        puts "#{player.name} was skipped."
      end
      puts player.look_for_treasure
      puts "#{player.name}'s treasures: #{player.found_treasures}\n"
    end
  end
end
