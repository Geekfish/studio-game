# frozen_string_literal: true

require_relative 'game/turn'

class Game
  attr_reader :title

  HIGH_SCORE_WIDTH = 20

  def initialize(title, players = [])
    @title = title
    @players = players
  end

  def add_player(player) = @players << player

  def play(rounds)
    puts "There are #{@players.length} players in the game."
    1.upto(rounds) do |round|
      print_heading("Round #{round} - FIGHT!")
      @players.each { |player| Turn.take(player) }
    end

    print_stats
    print_highscores
  end

  def print_stats
    print_heading("#{@title} Statistics:")

    strong, wimpy = @players.partition(&:strong?)

    print_heading('Strong players:', '-')
    strong.each(&method(:print_player_stats))

    print_heading('Wimpy players:', '-')
    wimpy.each(&method(:print_player_stats))
  end

  def print_highscores
    print_heading("#{@title} High Scores:")
    @players.sort.take(3).each(&method(:print_score))
  end

  private

  def print_heading(text, underline = '=')
    puts "\n#{text}"
    puts underline * text.length
  end

  def print_player_stats(player)
    puts "#{player.name} (#{player.health}"
  end

  def print_score(player)
    puts "#{player.name.ljust(HIGH_SCORE_WIDTH, '.')}#{player.score}"
  end
end
