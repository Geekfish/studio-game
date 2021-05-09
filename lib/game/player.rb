# frozen_string_literal: true

require_relative 'treasure_trove'

class Player
  attr_reader :name, :health, :found_treasures

  def initialize(name, health = 100)
    self.name = name
    @health = health
    @found_treasures = Hash.new(0)
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{score}."
  end

  def self.from_csv(*args)
    name, health = args
    new(name, Integer(health))
  end

  def to_csv = "#{name},#{score}"

  def <=>(other)
    other.score <=> score
  end

  def score
    @health + points
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def points = @found_treasures.values.sum

  def each_found_treasure
    @found_treasures.each do |name, points|
      yield TreasureTrove::Treasure.new(name, points)
    end
  end

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
  end

  def look_for_treasure
    treasure = TreasureTrove.random
    found_treasure(treasure)
    puts "#{@name} found a #{treasure.name} worth #{treasure.points}."
  end

  def w00t(health = 15)
    puts "#{@name} got w00ted!"
    update_health(health)
  end

  def blam(damage = 10)
    puts "#{@name} got blammed!"
    update_health(-damage)
  end

  def strong? = @health >= 100

  private

  def update_health(delta) = @health += delta
end
