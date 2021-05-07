# frozen_string_literal: true

class Die
  def initialize(min = 1, max = 10)
    @min = min
    @max = max
  end

  def roll
    rand(@min...@max)
  end
end
