# frozen_string_literal: true

require_relative 'game/turn'

class Game
  attr_reader :title

  def initialize(title, players = [])
    @title = title
    @players = players
  end

  def add_player(player) = @players << player

  def play
    puts "There are #{@players.length} players in the game:"
    @players.each { |player| Turn.take(player) }
  end
end
