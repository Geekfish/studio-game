# frozen_string_literal: true

require_relative 'player'

class BerserkPlayer < Player
  include Playable

  def initialize(*args)
    super(*args)
    @w00t_count = 0
  end

  def w00t(*args)
    super(*args)
    @w00t_count += 1
    puts 'Berserker is berserk!' if berserk?
  end

  def blam(*args)
    berserk? ? w00t : super(*args)
  end

  def berserk? = @w00t_count > 5
end
