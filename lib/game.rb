# frozen_string_literal: true

class Game
  attr_reader :title

  def initialize(title, players = [])
    @title = title
    @players = players
    @die = Game::Die.new
  end

  def add_player(player) = @players << player

  def play
    puts "There are #{@players.length} players in the game:"
    @players.each(&method(:play_player))
  end

  private

  def play_player(player)
    case @die.roll
    when 1..2
      player.blam
    when 5..6
      player.w00t
    else
      puts "#{player.name} was skipped."
    end
    puts player
  end
end
