# frozen_string_literal: true

class Game
  attr_reader :title

  def initialize(title, players = [])
    @title = title
    @players = players
  end

  def add_player(player) = @players << player

  def roll_die
    rand(1...20)
  end

  def play
    puts "There are #{@players.length} players in the game:"
    @players.each do |player|
      case roll_die
      when 1..7
        player.blam
      when 14..20
        player.w00t
      end

      puts player
    end
  end
end
