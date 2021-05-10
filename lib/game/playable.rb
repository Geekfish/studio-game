# frozen_string_literal: true

module Playable
  def w00t(health = 15)
    puts "#{@name} got w00ted!"
    update_health(health)
  end

  def blam(damage = 10)
    puts "#{@name} got blammed!"
    update_health(-damage)
  end

  def strong? = @health >= 100
end
