# frozen_string_literal: true

players = [
  { name: 'larry', health: 60 },
  { name: 'curly', health: 40 },
  { name: 'moe', health: 58 }
]

current_time = Time.new

puts 'Player health:'
players.each do |player|
  puts "- #{player[:name].capitalize.ljust(30, '.')} #{player[:health]}"
end

puts "The game started on #{current_time.strftime('%A %d/%m/%Y at %I:%M:%S%p')}"
