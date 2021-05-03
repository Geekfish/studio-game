# frozen_string_literal: true

class Game
  attr_reader :title

  def initialize(title, players = [])
    @title = title
    @players = players
  end

  def add_player(player) = @players << player

  def play
    puts "There are #{@players.length} players in the game:"
    @players.each do |player|
      puts player
    end
  end
end
