require 'game'
require 'game/player'

describe Game::Player do
  it 'sets player name and health' do
    player = Game::Player.new('bob')
    expect(player.name).to eq('Bob')
    expect(player.health).to eq(100)
  end
end
