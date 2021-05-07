# frozen_string_literal: true

class Player
  attr_reader :name, :health

  def initialize(name, health = 100)
    self.name = name
    @health = health
  end

  def to_s
    puts "I'm #{@name} with a health of #{@health}."
  end

  def <=>(other)
    other.score <=> score
  end

  def score
    @health + @name.length
  end

  def name=(new_name)
    @name = new_name.capitalize
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
