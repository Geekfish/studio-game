# frozen_string_literal: true
require_relative 'die'

module Turn
  def self.take(player)
    case Die.new.roll
    when 1..2
      player.blam
    when 5..6
      player.w00t
    else
      puts "#{player.name} was skipped."
    end
    puts player.to_s
  end
end
