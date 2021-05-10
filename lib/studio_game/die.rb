# frozen_string_literal: true

require_relative 'auditable'

module StudioGame
  class Die
    include Auditable

    attr_reader :number

    def initialize(min = 1, max = 10)
      @min = min
      @max = max
    end

    def roll
      @number = rand(@min...@max)
      audit
      @number
    end
  end
end
