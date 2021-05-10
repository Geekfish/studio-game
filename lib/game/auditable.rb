# frozen_string_literal: true

module Auditable
  def audit
    puts "Rolled a #{number} (#{self.class})"
  end
end
