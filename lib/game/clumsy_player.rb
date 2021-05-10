# frozen_string_literal: true

require_relative 'player'

class ClumsyPlayer < Player
  include Playable

  attr_reader :boost_factor

  def initialize(name, health = 100, boost_factor = 10)
    @boost_factor = boost_factor
    super(name, health)
  end

  def found_treasure(treasure)
    treasure = treasure.dup
    treasure.points /= 2
    super(treasure)
  end

  def w00t(*args) = @boost_factor.times { super(*args) }
end
